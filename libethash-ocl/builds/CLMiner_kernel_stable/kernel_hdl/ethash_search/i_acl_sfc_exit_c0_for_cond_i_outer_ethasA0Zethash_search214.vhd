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

-- VHDL created from i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search214
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

entity i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search214 is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_5 : in std_logic_vector(5 downto 0);  -- ufix6
        in_data_in_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_30 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_31 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_32 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_33 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_34 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_35 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_36 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_37 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_38 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_39 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_40 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_41 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_42 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_43 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_44 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_45 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_46 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_47 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_48 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_49 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_50 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_51 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_52 : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_accepted : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_5 : out std_logic_vector(5 downto 0);  -- ufix6
        out_data_out_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_30 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_31 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_32 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_33 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_34 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_35 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_36 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_37 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_38 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_39 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_40 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_41 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_42 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_43 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_44 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_45 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_46 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_47 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_48 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_49 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_50 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_51 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_52 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_entry : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search214;

architecture normal of i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search214 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_37 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_38 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_41 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_42 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_43 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_44 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_45 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_46 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_47 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_48 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_49 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_50 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_51 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_52 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_42 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_43 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_44 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_49 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_50 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_52 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_full_detector is
        port (
            in_dec_pipelined_thread : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_decrement : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_inc_pipelined_thread : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_increment : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_full : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_throttle : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_41 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_42 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_43 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_44 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_46 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_47 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_48 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_49 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_50 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_51 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_52 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_full_detector_out_full : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_q : STD_LOGIC_VECTOR (0 downto 0);
    signal output_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x(BLACKBOX,5)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_data_out_2@20000003
    -- out out_data_out_3@20000003
    -- out out_data_out_4@20000003
    -- out out_data_out_5@20000003
    -- out out_data_out_6@20000003
    -- out out_data_out_7@20000003
    -- out out_data_out_8@20000003
    -- out out_data_out_9@20000003
    -- out out_data_out_10@20000003
    -- out out_data_out_11@20000003
    -- out out_data_out_12@20000003
    -- out out_data_out_13@20000003
    -- out out_data_out_14@20000003
    -- out out_data_out_15@20000003
    -- out out_data_out_16@20000003
    -- out out_data_out_17@20000003
    -- out out_data_out_18@20000003
    -- out out_data_out_19@20000003
    -- out out_data_out_20@20000003
    -- out out_data_out_21@20000003
    -- out out_data_out_22@20000003
    -- out out_data_out_23@20000003
    -- out out_data_out_24@20000003
    -- out out_data_out_25@20000003
    -- out out_data_out_26@20000003
    -- out out_data_out_27@20000003
    -- out out_data_out_28@20000003
    -- out out_data_out_29@20000003
    -- out out_data_out_30@20000003
    -- out out_data_out_31@20000003
    -- out out_data_out_32@20000003
    -- out out_data_out_33@20000003
    -- out out_data_out_34@20000003
    -- out out_data_out_35@20000003
    -- out out_data_out_36@20000003
    -- out out_data_out_37@20000003
    -- out out_data_out_38@20000003
    -- out out_data_out_39@20000003
    -- out out_data_out_40@20000003
    -- out out_data_out_41@20000003
    -- out out_data_out_42@20000003
    -- out out_data_out_43@20000003
    -- out out_data_out_44@20000003
    -- out out_data_out_45@20000003
    -- out out_data_out_46@20000003
    -- out out_data_out_47@20000003
    -- out out_data_out_48@20000003
    -- out out_data_out_49@20000003
    -- out out_data_out_50@20000003
    -- out out_data_out_51@20000003
    -- out out_data_out_52@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x : i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo
    PORT MAP (
        in_data_in_0 => in_data_in_0,
        in_data_in_1 => in_data_in_1,
        in_data_in_2 => in_data_in_2,
        in_data_in_3 => in_data_in_3,
        in_data_in_4 => in_data_in_4,
        in_data_in_5 => in_data_in_5,
        in_data_in_6 => in_data_in_6,
        in_data_in_7 => in_data_in_7,
        in_data_in_8 => in_data_in_8,
        in_data_in_9 => in_data_in_9,
        in_data_in_10 => in_data_in_10,
        in_data_in_11 => in_data_in_11,
        in_data_in_12 => in_data_in_12,
        in_data_in_13 => in_data_in_13,
        in_data_in_14 => in_data_in_14,
        in_data_in_15 => in_data_in_15,
        in_data_in_16 => in_data_in_16,
        in_data_in_17 => in_data_in_17,
        in_data_in_18 => in_data_in_18,
        in_data_in_19 => in_data_in_19,
        in_data_in_20 => in_data_in_20,
        in_data_in_21 => in_data_in_21,
        in_data_in_22 => in_data_in_22,
        in_data_in_23 => in_data_in_23,
        in_data_in_24 => in_data_in_24,
        in_data_in_25 => in_data_in_25,
        in_data_in_26 => in_data_in_26,
        in_data_in_27 => in_data_in_27,
        in_data_in_28 => in_data_in_28,
        in_data_in_29 => in_data_in_29,
        in_data_in_30 => in_data_in_30,
        in_data_in_31 => in_data_in_31,
        in_data_in_32 => in_data_in_32,
        in_data_in_33 => in_data_in_33,
        in_data_in_34 => in_data_in_34,
        in_data_in_35 => in_data_in_35,
        in_data_in_36 => in_data_in_36,
        in_data_in_37 => in_data_in_37,
        in_data_in_38 => in_data_in_38,
        in_data_in_39 => in_data_in_39,
        in_data_in_40 => in_data_in_40,
        in_data_in_41 => in_data_in_41,
        in_data_in_42 => in_data_in_42,
        in_data_in_43 => in_data_in_43,
        in_data_in_44 => in_data_in_44,
        in_data_in_45 => in_data_in_45,
        in_data_in_46 => in_data_in_46,
        in_data_in_47 => in_data_in_47,
        in_data_in_48 => in_data_in_48,
        in_data_in_49 => in_data_in_49,
        in_data_in_50 => in_data_in_50,
        in_data_in_51 => in_data_in_51,
        in_data_in_52 => in_data_in_52,
        in_stall_in => in_stall_in,
        in_valid_in => in_valid_in,
        out_data_out_0 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_16,
        out_data_out_17 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_17,
        out_data_out_18 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_18,
        out_data_out_19 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_19,
        out_data_out_20 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_20,
        out_data_out_21 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_21,
        out_data_out_22 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_22,
        out_data_out_23 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_23,
        out_data_out_24 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_24,
        out_data_out_25 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_25,
        out_data_out_26 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_26,
        out_data_out_27 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_27,
        out_data_out_28 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_28,
        out_data_out_29 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_29,
        out_data_out_30 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_30,
        out_data_out_31 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_31,
        out_data_out_32 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_32,
        out_data_out_33 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_33,
        out_data_out_34 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_34,
        out_data_out_35 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_35,
        out_data_out_36 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_36,
        out_data_out_37 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_37,
        out_data_out_38 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_38,
        out_data_out_39 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_39,
        out_data_out_40 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_40,
        out_data_out_41 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_41,
        out_data_out_42 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_42,
        out_data_out_43 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_43,
        out_data_out_44 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_44,
        out_data_out_45 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_45,
        out_data_out_46 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_46,
        out_data_out_47 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_47,
        out_data_out_48 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_48,
        out_data_out_49 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_49,
        out_data_out_50 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_50,
        out_data_out_51 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_51,
        out_data_out_52 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_52,
        out_valid_out => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_0;
    out_data_out_1 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_1;
    out_data_out_2 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_2;
    out_data_out_3 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_3;
    out_data_out_4 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_4;
    out_data_out_5 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_5;
    out_data_out_6 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_6;
    out_data_out_7 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_7;
    out_data_out_8 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_8;
    out_data_out_9 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_9;
    out_data_out_10 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_10;
    out_data_out_11 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_11;
    out_data_out_12 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_12;
    out_data_out_13 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_13;
    out_data_out_14 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_14;
    out_data_out_15 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_15;
    out_data_out_16 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_16;
    out_data_out_17 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_17;
    out_data_out_18 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_18;
    out_data_out_19 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_19;
    out_data_out_20 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_20;
    out_data_out_21 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_21;
    out_data_out_22 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_22;
    out_data_out_23 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_23;
    out_data_out_24 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_24;
    out_data_out_25 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_25;
    out_data_out_26 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_26;
    out_data_out_27 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_27;
    out_data_out_28 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_28;
    out_data_out_29 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_29;
    out_data_out_30 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_30;
    out_data_out_31 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_31;
    out_data_out_32 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_32;
    out_data_out_33 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_33;
    out_data_out_34 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_34;
    out_data_out_35 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_35;
    out_data_out_36 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_36;
    out_data_out_37 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_37;
    out_data_out_38 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_38;
    out_data_out_39 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_39;
    out_data_out_40 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_40;
    out_data_out_41 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_41;
    out_data_out_42 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_42;
    out_data_out_43 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_43;
    out_data_out_44 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_44;
    out_data_out_45 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_45;
    out_data_out_46 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_46;
    out_data_out_47 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_47;
    out_data_out_48 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_48;
    out_data_out_49 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_49;
    out_data_out_50 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_50;
    out_data_out_51 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_51;
    out_data_out_52 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_data_out_52;
    out_valid_out <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_valid_out;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in(LOGICAL,8)
    not_stall_in_q <= not (in_stall_in);

    -- output_accepted_and(LOGICAL,9)
    output_accepted_and_q <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo_aunroll_x_out_valid_out and not_stall_in_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_full_detector(BLACKBOX,7)@20000000
    thei_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_full_detector : i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_full_detector
    PORT MAP (
        in_dec_pipelined_thread => GND_q,
        in_decrement => output_accepted_and_q,
        in_inc_pipelined_thread => GND_q,
        in_increment => in_input_accepted,
        out_full => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_full_detector_out_full,
        clock => clock,
        resetn => resetn
    );

    -- sync_out(GPOUT,11)@20000000
    out_stall_entry <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_full_detector_out_full;

END normal;
