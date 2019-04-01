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

-- VHDL created from i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search
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

entity i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search is
    port (
        in_c0_eni3678_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3678_1 : in std_logic_vector(5 downto 0);  -- ufix6
        in_c0_eni3678_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3678_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_5 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_15 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_16 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_17 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_22 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_23 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_24 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_27 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_28 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_29 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_30 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3678_33 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_34 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_35 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3678_36 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit152_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit152_1 : out std_logic_vector(5 downto 0);  -- ufix6
        out_c0_exit152_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_18 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_19 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_20 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_21 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_22 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_23 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_24 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_25 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_26 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_27 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_28 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_29 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_30 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_31 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_32 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_33 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_34 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit152_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit152_36 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search;

architecture normal of i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search550 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_data_in_18 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_data_out_18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367 is
        port (
            in_c0_eni3678_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3678_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_c0_eni3678_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3678_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_15 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_16 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi36151_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi36151_1 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exi36151_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_20 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi36151_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi36151_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_1 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_18 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_19 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_20 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_21 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_22 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_23 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,7)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,6)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x(BLACKBOX,5)@1
    -- out out_c0_exi36151_0@2
    -- out out_c0_exi36151_1@2
    -- out out_c0_exi36151_2@2
    -- out out_c0_exi36151_3@2
    -- out out_c0_exi36151_4@2
    -- out out_c0_exi36151_5@2
    -- out out_c0_exi36151_6@2
    -- out out_c0_exi36151_7@2
    -- out out_c0_exi36151_8@2
    -- out out_c0_exi36151_9@2
    -- out out_c0_exi36151_10@2
    -- out out_c0_exi36151_11@2
    -- out out_c0_exi36151_12@2
    -- out out_c0_exi36151_13@2
    -- out out_c0_exi36151_14@2
    -- out out_c0_exi36151_15@2
    -- out out_c0_exi36151_16@2
    -- out out_c0_exi36151_17@2
    -- out out_c0_exi36151_18@2
    -- out out_c0_exi36151_19@2
    -- out out_c0_exi36151_20@2
    -- out out_c0_exi36151_21@2
    -- out out_c0_exi36151_22@2
    -- out out_c0_exi36151_23@2
    -- out out_c0_exi36151_24@2
    -- out out_c0_exi36151_25@2
    -- out out_c0_exi36151_26@2
    -- out out_c0_exi36151_27@2
    -- out out_c0_exi36151_28@2
    -- out out_c0_exi36151_29@2
    -- out out_c0_exi36151_30@2
    -- out out_c0_exi36151_31@2
    -- out out_c0_exi36151_32@2
    -- out out_c0_exi36151_33@2
    -- out out_c0_exi36151_34@2
    -- out out_c0_exi36151_35@2
    -- out out_c0_exi36151_36@2
    -- out out_o_valid@2
    thei_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x : i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367
    PORT MAP (
        in_c0_eni3678_0 => in_c0_eni3678_0,
        in_c0_eni3678_1 => in_c0_eni3678_1,
        in_c0_eni3678_2 => in_c0_eni3678_2,
        in_c0_eni3678_3 => in_c0_eni3678_3,
        in_c0_eni3678_4 => in_c0_eni3678_4,
        in_c0_eni3678_5 => in_c0_eni3678_5,
        in_c0_eni3678_6 => in_c0_eni3678_6,
        in_c0_eni3678_7 => in_c0_eni3678_7,
        in_c0_eni3678_8 => in_c0_eni3678_8,
        in_c0_eni3678_9 => in_c0_eni3678_9,
        in_c0_eni3678_10 => in_c0_eni3678_10,
        in_c0_eni3678_11 => in_c0_eni3678_11,
        in_c0_eni3678_12 => in_c0_eni3678_12,
        in_c0_eni3678_13 => in_c0_eni3678_13,
        in_c0_eni3678_14 => in_c0_eni3678_14,
        in_c0_eni3678_15 => in_c0_eni3678_15,
        in_c0_eni3678_16 => in_c0_eni3678_16,
        in_c0_eni3678_17 => in_c0_eni3678_17,
        in_c0_eni3678_18 => in_c0_eni3678_18,
        in_c0_eni3678_19 => in_c0_eni3678_19,
        in_c0_eni3678_20 => in_c0_eni3678_20,
        in_c0_eni3678_21 => in_c0_eni3678_21,
        in_c0_eni3678_22 => in_c0_eni3678_22,
        in_c0_eni3678_23 => in_c0_eni3678_23,
        in_c0_eni3678_24 => in_c0_eni3678_24,
        in_c0_eni3678_25 => in_c0_eni3678_25,
        in_c0_eni3678_26 => in_c0_eni3678_26,
        in_c0_eni3678_27 => in_c0_eni3678_27,
        in_c0_eni3678_28 => in_c0_eni3678_28,
        in_c0_eni3678_29 => in_c0_eni3678_29,
        in_c0_eni3678_30 => in_c0_eni3678_30,
        in_c0_eni3678_31 => in_c0_eni3678_31,
        in_c0_eni3678_32 => in_c0_eni3678_32,
        in_c0_eni3678_33 => in_c0_eni3678_33,
        in_c0_eni3678_34 => in_c0_eni3678_34,
        in_c0_eni3678_35 => in_c0_eni3678_35,
        in_c0_eni3678_36 => in_c0_eni3678_36,
        in_i_valid => input_accepted_and_q,
        out_c0_exi36151_0 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_0,
        out_c0_exi36151_1 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_1,
        out_c0_exi36151_2 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_2,
        out_c0_exi36151_3 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_3,
        out_c0_exi36151_4 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_4,
        out_c0_exi36151_5 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_5,
        out_c0_exi36151_6 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_6,
        out_c0_exi36151_7 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_7,
        out_c0_exi36151_8 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_8,
        out_c0_exi36151_9 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_9,
        out_c0_exi36151_10 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_10,
        out_c0_exi36151_11 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_11,
        out_c0_exi36151_12 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_12,
        out_c0_exi36151_13 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_13,
        out_c0_exi36151_14 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_14,
        out_c0_exi36151_15 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_15,
        out_c0_exi36151_16 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_16,
        out_c0_exi36151_17 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_17,
        out_c0_exi36151_18 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_18,
        out_c0_exi36151_19 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_19,
        out_c0_exi36151_20 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_20,
        out_c0_exi36151_21 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_21,
        out_c0_exi36151_22 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_22,
        out_c0_exi36151_23 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_23,
        out_c0_exi36151_24 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_24,
        out_c0_exi36151_25 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_25,
        out_c0_exi36151_26 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_26,
        out_c0_exi36151_27 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_27,
        out_c0_exi36151_28 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_28,
        out_c0_exi36151_29 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_29,
        out_c0_exi36151_30 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_30,
        out_c0_exi36151_31 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_31,
        out_c0_exi36151_32 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_32,
        out_c0_exi36151_33 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_33,
        out_c0_exi36151_34 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_34,
        out_c0_exi36151_35 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_35,
        out_c0_exi36151_36 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_36,
        out_o_valid => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x(BLACKBOX,4)@20000000
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
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x : i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search550
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_0,
        in_data_in_1 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_1,
        in_data_in_2 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_2,
        in_data_in_3 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_3,
        in_data_in_4 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_4,
        in_data_in_5 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_5,
        in_data_in_6 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_6,
        in_data_in_7 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_7,
        in_data_in_8 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_8,
        in_data_in_9 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_9,
        in_data_in_10 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_10,
        in_data_in_11 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_11,
        in_data_in_12 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_12,
        in_data_in_13 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_13,
        in_data_in_14 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_14,
        in_data_in_15 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_15,
        in_data_in_16 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_16,
        in_data_in_17 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_17,
        in_data_in_18 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_18,
        in_data_in_19 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_19,
        in_data_in_20 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_20,
        in_data_in_21 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_21,
        in_data_in_22 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_22,
        in_data_in_23 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_23,
        in_data_in_24 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_24,
        in_data_in_25 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_25,
        in_data_in_26 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_26,
        in_data_in_27 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_27,
        in_data_in_28 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_28,
        in_data_in_29 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_29,
        in_data_in_30 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_30,
        in_data_in_31 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_31,
        in_data_in_32 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_32,
        in_data_in_33 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_33,
        in_data_in_34 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_34,
        in_data_in_35 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_35,
        in_data_in_36 => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_c0_exi36151_36,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search367_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_16,
        out_data_out_17 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_17,
        out_data_out_18 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_18,
        out_data_out_19 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_19,
        out_data_out_20 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_20,
        out_data_out_21 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_21,
        out_data_out_22 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_22,
        out_data_out_23 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_23,
        out_data_out_24 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_24,
        out_data_out_25 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_25,
        out_data_out_26 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_26,
        out_data_out_27 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_27,
        out_data_out_28 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_28,
        out_data_out_29 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_29,
        out_data_out_30 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_30,
        out_data_out_31 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_31,
        out_data_out_32 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_32,
        out_data_out_33 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_33,
        out_data_out_34 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_34,
        out_data_out_35 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_35,
        out_data_out_36 => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_36,
        out_stall_entry => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@5
    out_c0_exit152_0 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_0;
    out_c0_exit152_1 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_1;
    out_c0_exit152_2 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_2;
    out_c0_exit152_3 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_3;
    out_c0_exit152_4 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_4;
    out_c0_exit152_5 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_5;
    out_c0_exit152_6 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_6;
    out_c0_exit152_7 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_7;
    out_c0_exit152_8 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_8;
    out_c0_exit152_9 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_9;
    out_c0_exit152_10 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_10;
    out_c0_exit152_11 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_11;
    out_c0_exit152_12 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_12;
    out_c0_exit152_13 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_13;
    out_c0_exit152_14 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_14;
    out_c0_exit152_15 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_15;
    out_c0_exit152_16 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_16;
    out_c0_exit152_17 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_17;
    out_c0_exit152_18 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_18;
    out_c0_exit152_19 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_19;
    out_c0_exit152_20 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_20;
    out_c0_exit152_21 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_21;
    out_c0_exit152_22 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_22;
    out_c0_exit152_23 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_23;
    out_c0_exit152_24 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_24;
    out_c0_exit152_25 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_25;
    out_c0_exit152_26 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_26;
    out_c0_exit152_27 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_27;
    out_c0_exit152_28 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_28;
    out_c0_exit152_29 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_29;
    out_c0_exit152_30 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_30;
    out_c0_exit152_31 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_31;
    out_c0_exit152_32 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_32;
    out_c0_exit152_33 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_33;
    out_c0_exit152_34 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_34;
    out_c0_exit152_35 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_35;
    out_c0_exit152_36 <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_data_out_36;
    out_o_valid <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_valid_out;

    -- sync_out(GPOUT,9)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search_aunroll_x_out_stall_entry;

END normal;
