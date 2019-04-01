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

-- VHDL created from i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search
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

entity i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search is
    port (
        in_c0_eni47_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni47_1 : in std_logic_vector(5 downto 0);  -- ufix6
        in_c0_eni47_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_5 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_14 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_17 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_18 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_19 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_20 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_23 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_24 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_25 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_26 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_27 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_28 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_29 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_30 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_31 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni47_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni47_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_5 : out std_logic_vector(5 downto 0);  -- ufix6
        out_c0_exit_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_30 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_31 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_32 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_33 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_34 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_35 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_36 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_37 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_38 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_39 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_40 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_41 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_42 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_43 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_44 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_45 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_46 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_47 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_48 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_49 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_50 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit_51 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit_52 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search;

architecture normal of i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search214 is
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
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19 is
        port (
            in_c0_eni47_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni47_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_c0_eni47_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_14 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_18 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_20 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni47_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi52_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi52_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_5 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exi52_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_42 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_43 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_44 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_49 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_50 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi52_51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi52_52 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_41 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_42 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_43 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_44 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_46 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_47 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_48 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_49 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_50 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_51 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_52 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_5 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_41 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_42 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_43 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_44 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_46 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_47 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_48 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_49 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_50 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_51 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_52 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,7)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,6)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x(BLACKBOX,5)@1
    -- out out_c0_exi52_0@2
    -- out out_c0_exi52_1@2
    -- out out_c0_exi52_2@2
    -- out out_c0_exi52_3@2
    -- out out_c0_exi52_4@2
    -- out out_c0_exi52_5@2
    -- out out_c0_exi52_6@2
    -- out out_c0_exi52_7@2
    -- out out_c0_exi52_8@2
    -- out out_c0_exi52_9@2
    -- out out_c0_exi52_10@2
    -- out out_c0_exi52_11@2
    -- out out_c0_exi52_12@2
    -- out out_c0_exi52_13@2
    -- out out_c0_exi52_14@2
    -- out out_c0_exi52_15@2
    -- out out_c0_exi52_16@2
    -- out out_c0_exi52_17@2
    -- out out_c0_exi52_18@2
    -- out out_c0_exi52_19@2
    -- out out_c0_exi52_20@2
    -- out out_c0_exi52_21@2
    -- out out_c0_exi52_22@2
    -- out out_c0_exi52_23@2
    -- out out_c0_exi52_24@2
    -- out out_c0_exi52_25@2
    -- out out_c0_exi52_26@2
    -- out out_c0_exi52_27@2
    -- out out_c0_exi52_28@2
    -- out out_c0_exi52_29@2
    -- out out_c0_exi52_30@2
    -- out out_c0_exi52_31@2
    -- out out_c0_exi52_32@2
    -- out out_c0_exi52_33@2
    -- out out_c0_exi52_34@2
    -- out out_c0_exi52_35@2
    -- out out_c0_exi52_36@2
    -- out out_c0_exi52_37@2
    -- out out_c0_exi52_38@2
    -- out out_c0_exi52_39@2
    -- out out_c0_exi52_40@2
    -- out out_c0_exi52_41@2
    -- out out_c0_exi52_42@2
    -- out out_c0_exi52_43@2
    -- out out_c0_exi52_44@2
    -- out out_c0_exi52_45@2
    -- out out_c0_exi52_46@2
    -- out out_c0_exi52_47@2
    -- out out_c0_exi52_48@2
    -- out out_c0_exi52_49@2
    -- out out_c0_exi52_50@2
    -- out out_c0_exi52_51@2
    -- out out_c0_exi52_52@2
    -- out out_o_valid@2
    thei_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x : i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19
    PORT MAP (
        in_c0_eni47_0 => in_c0_eni47_0,
        in_c0_eni47_1 => in_c0_eni47_1,
        in_c0_eni47_2 => in_c0_eni47_2,
        in_c0_eni47_3 => in_c0_eni47_3,
        in_c0_eni47_4 => in_c0_eni47_4,
        in_c0_eni47_5 => in_c0_eni47_5,
        in_c0_eni47_6 => in_c0_eni47_6,
        in_c0_eni47_7 => in_c0_eni47_7,
        in_c0_eni47_8 => in_c0_eni47_8,
        in_c0_eni47_9 => in_c0_eni47_9,
        in_c0_eni47_10 => in_c0_eni47_10,
        in_c0_eni47_11 => in_c0_eni47_11,
        in_c0_eni47_12 => in_c0_eni47_12,
        in_c0_eni47_13 => in_c0_eni47_13,
        in_c0_eni47_14 => in_c0_eni47_14,
        in_c0_eni47_15 => in_c0_eni47_15,
        in_c0_eni47_16 => in_c0_eni47_16,
        in_c0_eni47_17 => in_c0_eni47_17,
        in_c0_eni47_18 => in_c0_eni47_18,
        in_c0_eni47_19 => in_c0_eni47_19,
        in_c0_eni47_20 => in_c0_eni47_20,
        in_c0_eni47_21 => in_c0_eni47_21,
        in_c0_eni47_22 => in_c0_eni47_22,
        in_c0_eni47_23 => in_c0_eni47_23,
        in_c0_eni47_24 => in_c0_eni47_24,
        in_c0_eni47_25 => in_c0_eni47_25,
        in_c0_eni47_26 => in_c0_eni47_26,
        in_c0_eni47_27 => in_c0_eni47_27,
        in_c0_eni47_28 => in_c0_eni47_28,
        in_c0_eni47_29 => in_c0_eni47_29,
        in_c0_eni47_30 => in_c0_eni47_30,
        in_c0_eni47_31 => in_c0_eni47_31,
        in_c0_eni47_32 => in_c0_eni47_32,
        in_c0_eni47_33 => in_c0_eni47_33,
        in_c0_eni47_34 => in_c0_eni47_34,
        in_c0_eni47_35 => in_c0_eni47_35,
        in_c0_eni47_36 => in_c0_eni47_36,
        in_c0_eni47_37 => in_c0_eni47_37,
        in_c0_eni47_38 => in_c0_eni47_38,
        in_c0_eni47_39 => in_c0_eni47_39,
        in_c0_eni47_40 => in_c0_eni47_40,
        in_c0_eni47_41 => in_c0_eni47_41,
        in_c0_eni47_42 => in_c0_eni47_42,
        in_c0_eni47_43 => in_c0_eni47_43,
        in_c0_eni47_44 => in_c0_eni47_44,
        in_c0_eni47_45 => in_c0_eni47_45,
        in_c0_eni47_46 => in_c0_eni47_46,
        in_c0_eni47_47 => in_c0_eni47_47,
        in_i_valid => input_accepted_and_q,
        in_isolate => in_isolate,
        out_c0_exi52_0 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_0,
        out_c0_exi52_1 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_1,
        out_c0_exi52_2 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_2,
        out_c0_exi52_3 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_3,
        out_c0_exi52_4 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_4,
        out_c0_exi52_5 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_5,
        out_c0_exi52_6 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_6,
        out_c0_exi52_7 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_7,
        out_c0_exi52_8 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_8,
        out_c0_exi52_9 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_9,
        out_c0_exi52_10 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_10,
        out_c0_exi52_11 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_11,
        out_c0_exi52_12 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_12,
        out_c0_exi52_13 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_13,
        out_c0_exi52_14 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_14,
        out_c0_exi52_15 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_15,
        out_c0_exi52_16 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_16,
        out_c0_exi52_17 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_17,
        out_c0_exi52_18 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_18,
        out_c0_exi52_19 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_19,
        out_c0_exi52_20 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_20,
        out_c0_exi52_21 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_21,
        out_c0_exi52_22 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_22,
        out_c0_exi52_23 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_23,
        out_c0_exi52_24 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_24,
        out_c0_exi52_25 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_25,
        out_c0_exi52_26 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_26,
        out_c0_exi52_27 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_27,
        out_c0_exi52_28 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_28,
        out_c0_exi52_29 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_29,
        out_c0_exi52_30 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_30,
        out_c0_exi52_31 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_31,
        out_c0_exi52_32 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_32,
        out_c0_exi52_33 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_33,
        out_c0_exi52_34 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_34,
        out_c0_exi52_35 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_35,
        out_c0_exi52_36 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_36,
        out_c0_exi52_37 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_37,
        out_c0_exi52_38 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_38,
        out_c0_exi52_39 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_39,
        out_c0_exi52_40 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_40,
        out_c0_exi52_41 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_41,
        out_c0_exi52_42 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_42,
        out_c0_exi52_43 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_43,
        out_c0_exi52_44 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_44,
        out_c0_exi52_45 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_45,
        out_c0_exi52_46 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_46,
        out_c0_exi52_47 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_47,
        out_c0_exi52_48 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_48,
        out_c0_exi52_49 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_49,
        out_c0_exi52_50 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_50,
        out_c0_exi52_51 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_51,
        out_c0_exi52_52 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_52,
        out_o_valid => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x(BLACKBOX,4)@20000000
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
    thei_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x : i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search214
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_0,
        in_data_in_1 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_1,
        in_data_in_2 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_2,
        in_data_in_3 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_3,
        in_data_in_4 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_4,
        in_data_in_5 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_5,
        in_data_in_6 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_6,
        in_data_in_7 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_7,
        in_data_in_8 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_8,
        in_data_in_9 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_9,
        in_data_in_10 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_10,
        in_data_in_11 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_11,
        in_data_in_12 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_12,
        in_data_in_13 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_13,
        in_data_in_14 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_14,
        in_data_in_15 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_15,
        in_data_in_16 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_16,
        in_data_in_17 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_17,
        in_data_in_18 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_18,
        in_data_in_19 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_19,
        in_data_in_20 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_20,
        in_data_in_21 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_21,
        in_data_in_22 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_22,
        in_data_in_23 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_23,
        in_data_in_24 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_24,
        in_data_in_25 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_25,
        in_data_in_26 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_26,
        in_data_in_27 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_27,
        in_data_in_28 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_28,
        in_data_in_29 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_29,
        in_data_in_30 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_30,
        in_data_in_31 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_31,
        in_data_in_32 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_32,
        in_data_in_33 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_33,
        in_data_in_34 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_34,
        in_data_in_35 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_35,
        in_data_in_36 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_36,
        in_data_in_37 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_37,
        in_data_in_38 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_38,
        in_data_in_39 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_39,
        in_data_in_40 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_40,
        in_data_in_41 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_41,
        in_data_in_42 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_42,
        in_data_in_43 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_43,
        in_data_in_44 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_44,
        in_data_in_45 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_45,
        in_data_in_46 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_46,
        in_data_in_47 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_47,
        in_data_in_48 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_48,
        in_data_in_49 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_49,
        in_data_in_50 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_50,
        in_data_in_51 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_51,
        in_data_in_52 => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_c0_exi52_52,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search19_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_16,
        out_data_out_17 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_17,
        out_data_out_18 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_18,
        out_data_out_19 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_19,
        out_data_out_20 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_20,
        out_data_out_21 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_21,
        out_data_out_22 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_22,
        out_data_out_23 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_23,
        out_data_out_24 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_24,
        out_data_out_25 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_25,
        out_data_out_26 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_26,
        out_data_out_27 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_27,
        out_data_out_28 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_28,
        out_data_out_29 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_29,
        out_data_out_30 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_30,
        out_data_out_31 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_31,
        out_data_out_32 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_32,
        out_data_out_33 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_33,
        out_data_out_34 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_34,
        out_data_out_35 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_35,
        out_data_out_36 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_36,
        out_data_out_37 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_37,
        out_data_out_38 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_38,
        out_data_out_39 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_39,
        out_data_out_40 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_40,
        out_data_out_41 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_41,
        out_data_out_42 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_42,
        out_data_out_43 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_43,
        out_data_out_44 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_44,
        out_data_out_45 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_45,
        out_data_out_46 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_46,
        out_data_out_47 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_47,
        out_data_out_48 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_48,
        out_data_out_49 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_49,
        out_data_out_50 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_50,
        out_data_out_51 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_51,
        out_data_out_52 => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_52,
        out_stall_entry => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@5
    out_c0_exit_0 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_0;
    out_c0_exit_1 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_1;
    out_c0_exit_2 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_2;
    out_c0_exit_3 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_3;
    out_c0_exit_4 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_4;
    out_c0_exit_5 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_5;
    out_c0_exit_6 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_6;
    out_c0_exit_7 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_7;
    out_c0_exit_8 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_8;
    out_c0_exit_9 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_9;
    out_c0_exit_10 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_10;
    out_c0_exit_11 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_11;
    out_c0_exit_12 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_12;
    out_c0_exit_13 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_13;
    out_c0_exit_14 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_14;
    out_c0_exit_15 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_15;
    out_c0_exit_16 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_16;
    out_c0_exit_17 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_17;
    out_c0_exit_18 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_18;
    out_c0_exit_19 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_19;
    out_c0_exit_20 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_20;
    out_c0_exit_21 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_21;
    out_c0_exit_22 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_22;
    out_c0_exit_23 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_23;
    out_c0_exit_24 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_24;
    out_c0_exit_25 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_25;
    out_c0_exit_26 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_26;
    out_c0_exit_27 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_27;
    out_c0_exit_28 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_28;
    out_c0_exit_29 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_29;
    out_c0_exit_30 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_30;
    out_c0_exit_31 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_31;
    out_c0_exit_32 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_32;
    out_c0_exit_33 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_33;
    out_c0_exit_34 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_34;
    out_c0_exit_35 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_35;
    out_c0_exit_36 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_36;
    out_c0_exit_37 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_37;
    out_c0_exit_38 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_38;
    out_c0_exit_39 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_39;
    out_c0_exit_40 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_40;
    out_c0_exit_41 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_41;
    out_c0_exit_42 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_42;
    out_c0_exit_43 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_43;
    out_c0_exit_44 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_44;
    out_c0_exit_45 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_45;
    out_c0_exit_46 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_46;
    out_c0_exit_47 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_47;
    out_c0_exit_48 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_48;
    out_c0_exit_49 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_49;
    out_c0_exit_50 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_50;
    out_c0_exit_51 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_51;
    out_c0_exit_52 <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_data_out_52;
    out_o_valid <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_valid_out;

    -- sync_out(GPOUT,10)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search_aunroll_x_out_stall_entry;

END normal;
