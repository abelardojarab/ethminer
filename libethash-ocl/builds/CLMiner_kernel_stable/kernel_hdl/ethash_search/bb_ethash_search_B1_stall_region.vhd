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

-- VHDL created from bb_ethash_search_B1_stall_region
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

entity bb_ethash_search_B1_stall_region is
    port (
        in_arrayidx10_i_i803 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx12_i_i806 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx14_i_i809 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx16_i_i812 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx1_i_i856 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx20_i_i817 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx22_i_i820 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx24_i_i823 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx26_i_i826 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx2_i_i795 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30_i_i871 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx32_i_i834 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx34_i_i837 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_i_i840 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx39_i_i843 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx40_i_i845 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx42_i_i848 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx44_i_i851 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx46_i_i854 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx4_i_i797 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx6_i_i799 : in std_logic_vector(63 downto 0);  -- ufix64
        in_fpgaindvars_iv15 : in std_logic_vector(5 downto 0);  -- ufix6
        in_global_id_0197 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_08 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i_ph : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01001 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01003 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01005 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01007 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0987 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0989 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0991 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0993 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0995 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0997 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0999 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11000 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11002 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11004 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11006 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1988 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1990 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1992 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1994 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1996 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1998 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe30 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe31 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe32 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe33 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe34 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe35 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe36 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe37 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe38 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe39 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe40 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe41 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe42 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe43 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe44 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe45 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe46 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe47 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe48 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe49 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe5 : out std_logic_vector(5 downto 0);  -- ufix6
        out_c0_exe50 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe51 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe52 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_0197 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_08 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01001 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01003 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01005 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01007 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0987 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0989 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0991 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0993 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0995 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0997 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0999 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11000 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11002 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11004 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11006 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11008 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1988 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1990 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1992 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1994 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1996 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1998 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B1_stall_region;

architecture normal of bb_ethash_search_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_search_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_data_in_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_data_in_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_data_out_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_data_out_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search is
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
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_5 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exit_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_42 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_43 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_44 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_49 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_50 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_52 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_41 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_42 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_43 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_44 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_data_out_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_5 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_41 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_42 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_43 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_44 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_46 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_47 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_48 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_49 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_50 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_51 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_52 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_ethash_search_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (2245 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_aa : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_bb : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_cc : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_dd : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_ee : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_ff : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_gg : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_hh : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_ii : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_jj : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_kk : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_ll : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_mm : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_nn : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_oo : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_pp : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_qq : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_rr : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_ss : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_tt : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_uu : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_vv : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_ww : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_xx : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B1_merge_reg_aunroll_x_yy : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (2343 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_f : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ee : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ff : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_gg : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_hh : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ii : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_jj : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_kk : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ll : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_mm : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_nn : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_oo : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_pp : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_qq : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_rr : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ss : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_tt : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_uu : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_vv : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ww : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_xx : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_yy : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_zz : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (2245 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_n : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_o : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_p : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_r : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_s : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_t : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_u : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_v : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_w : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_stall_entry_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ee : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ff : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_gg : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_hh : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ii : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_kk : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ll : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_nn : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_oo : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_pp : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_rr : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ss : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_tt : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_uu : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vv : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ww : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_xx : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_yy : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,168)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= ethash_search_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,161)
    bubble_join_stall_entry_q <= in_scalarizer_1998 & in_scalarizer_1996 & in_scalarizer_1994 & in_scalarizer_1992 & in_scalarizer_1990 & in_scalarizer_1988 & in_scalarizer_11008 & in_scalarizer_11006 & in_scalarizer_11004 & in_scalarizer_11002 & in_scalarizer_11000 & in_scalarizer_1 & in_scalarizer_0999 & in_scalarizer_0997 & in_scalarizer_0995 & in_scalarizer_0993 & in_scalarizer_0991 & in_scalarizer_0989 & in_scalarizer_0987 & in_scalarizer_01007 & in_scalarizer_01005 & in_scalarizer_01003 & in_scalarizer_01001 & in_scalarizer_0 & in_r_0_i_ph & in_l_grpid_0_addr13 & in_l_grpid_08 & in_global_id_0197 & in_fpgaindvars_iv15 & in_arrayidx6_i_i799 & in_arrayidx4_i_i797 & in_arrayidx46_i_i854 & in_arrayidx44_i_i851 & in_arrayidx42_i_i848 & in_arrayidx40_i_i845 & in_arrayidx39_i_i843 & in_arrayidx36_i_i840 & in_arrayidx34_i_i837 & in_arrayidx32_i_i834 & in_arrayidx30_i_i871 & in_arrayidx2_i_i795 & in_arrayidx26_i_i826 & in_arrayidx24_i_i823 & in_arrayidx22_i_i820 & in_arrayidx20_i_i817 & in_arrayidx1_i_i856 & in_arrayidx16_i_i812 & in_arrayidx14_i_i809 & in_arrayidx12_i_i806 & in_arrayidx10_i_i803;

    -- bubble_select_stall_entry(BITSELECT,162)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 192));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(319 downto 256));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(383 downto 320));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(447 downto 384));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(511 downto 448));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(575 downto 512));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(639 downto 576));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(703 downto 640));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(767 downto 704));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(831 downto 768));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(895 downto 832));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(959 downto 896));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1023 downto 960));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1087 downto 1024));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1151 downto 1088));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1215 downto 1152));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1279 downto 1216));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1343 downto 1280));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1349 downto 1344));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1381 downto 1350));
    bubble_select_stall_entry_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1413 downto 1382));
    bubble_select_stall_entry_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1445 downto 1414));
    bubble_select_stall_entry_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1477 downto 1446));
    bubble_select_stall_entry_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1509 downto 1478));
    bubble_select_stall_entry_cc <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1541 downto 1510));
    bubble_select_stall_entry_dd <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1573 downto 1542));
    bubble_select_stall_entry_ee <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1605 downto 1574));
    bubble_select_stall_entry_ff <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1637 downto 1606));
    bubble_select_stall_entry_gg <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1669 downto 1638));
    bubble_select_stall_entry_hh <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1701 downto 1670));
    bubble_select_stall_entry_ii <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1733 downto 1702));
    bubble_select_stall_entry_jj <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1765 downto 1734));
    bubble_select_stall_entry_kk <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1797 downto 1766));
    bubble_select_stall_entry_ll <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1829 downto 1798));
    bubble_select_stall_entry_mm <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1861 downto 1830));
    bubble_select_stall_entry_nn <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1893 downto 1862));
    bubble_select_stall_entry_oo <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1925 downto 1894));
    bubble_select_stall_entry_pp <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1957 downto 1926));
    bubble_select_stall_entry_qq <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1989 downto 1958));
    bubble_select_stall_entry_rr <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2021 downto 1990));
    bubble_select_stall_entry_ss <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2053 downto 2022));
    bubble_select_stall_entry_tt <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2085 downto 2054));
    bubble_select_stall_entry_uu <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2117 downto 2086));
    bubble_select_stall_entry_vv <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2149 downto 2118));
    bubble_select_stall_entry_ww <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2181 downto 2150));
    bubble_select_stall_entry_xx <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2213 downto 2182));
    bubble_select_stall_entry_yy <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2245 downto 2214));

    -- ethash_search_B1_merge_reg_aunroll_x(BLACKBOX,6)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_data_out_9@1
    -- out out_data_out_10@1
    -- out out_data_out_11@1
    -- out out_data_out_12@1
    -- out out_data_out_13@1
    -- out out_data_out_14@1
    -- out out_data_out_15@1
    -- out out_data_out_16@1
    -- out out_data_out_17@1
    -- out out_data_out_18@1
    -- out out_data_out_19@1
    -- out out_data_out_20@1
    -- out out_data_out_21@1
    -- out out_data_out_22@1
    -- out out_data_out_23@1
    -- out out_data_out_24@1
    -- out out_data_out_25@1
    -- out out_data_out_26@1
    -- out out_data_out_27@1
    -- out out_data_out_28@1
    -- out out_data_out_29@1
    -- out out_data_out_30@1
    -- out out_data_out_31@1
    -- out out_data_out_32@1
    -- out out_data_out_33@1
    -- out out_data_out_34@1
    -- out out_data_out_35@1
    -- out out_data_out_36@1
    -- out out_data_out_37@1
    -- out out_data_out_38@1
    -- out out_data_out_39@1
    -- out out_data_out_40@1
    -- out out_data_out_41@1
    -- out out_data_out_42@1
    -- out out_data_out_43@1
    -- out out_data_out_44@1
    -- out out_data_out_45@1
    -- out out_data_out_46@1
    -- out out_data_out_47@1
    -- out out_data_out_48@1
    -- out out_data_out_49@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theethash_search_B1_merge_reg_aunroll_x : ethash_search_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_w,
        in_data_in_1 => bubble_select_stall_entry_bb,
        in_data_in_2 => bubble_select_stall_entry_nn,
        in_data_in_3 => bubble_select_stall_entry_gg,
        in_data_in_4 => bubble_select_stall_entry_tt,
        in_data_in_5 => bubble_select_stall_entry_hh,
        in_data_in_6 => bubble_select_stall_entry_uu,
        in_data_in_7 => bubble_select_stall_entry_ii,
        in_data_in_8 => bubble_select_stall_entry_vv,
        in_data_in_9 => bubble_select_stall_entry_jj,
        in_data_in_10 => bubble_select_stall_entry_ww,
        in_data_in_11 => bubble_select_stall_entry_kk,
        in_data_in_12 => bubble_select_stall_entry_xx,
        in_data_in_13 => bubble_select_stall_entry_ll,
        in_data_in_14 => bubble_select_stall_entry_yy,
        in_data_in_15 => bubble_select_stall_entry_mm,
        in_data_in_16 => bubble_select_stall_entry_oo,
        in_data_in_17 => bubble_select_stall_entry_cc,
        in_data_in_18 => bubble_select_stall_entry_pp,
        in_data_in_19 => bubble_select_stall_entry_dd,
        in_data_in_20 => bubble_select_stall_entry_qq,
        in_data_in_21 => bubble_select_stall_entry_ee,
        in_data_in_22 => bubble_select_stall_entry_rr,
        in_data_in_23 => bubble_select_stall_entry_ff,
        in_data_in_24 => bubble_select_stall_entry_ss,
        in_data_in_25 => bubble_select_stall_entry_t,
        in_data_in_26 => bubble_select_stall_entry_s,
        in_data_in_27 => bubble_select_stall_entry_r,
        in_data_in_28 => bubble_select_stall_entry_q,
        in_data_in_29 => bubble_select_stall_entry_p,
        in_data_in_30 => bubble_select_stall_entry_o,
        in_data_in_31 => bubble_select_stall_entry_n,
        in_data_in_32 => bubble_select_stall_entry_m,
        in_data_in_33 => bubble_select_stall_entry_j,
        in_data_in_34 => bubble_select_stall_entry_i,
        in_data_in_35 => bubble_select_stall_entry_h,
        in_data_in_36 => bubble_select_stall_entry_g,
        in_data_in_37 => bubble_select_stall_entry_e,
        in_data_in_38 => bubble_select_stall_entry_d,
        in_data_in_39 => bubble_select_stall_entry_c,
        in_data_in_40 => bubble_select_stall_entry_b,
        in_data_in_41 => bubble_select_stall_entry_v,
        in_data_in_42 => bubble_select_stall_entry_u,
        in_data_in_43 => bubble_select_stall_entry_k,
        in_data_in_44 => bubble_select_stall_entry_l,
        in_data_in_45 => bubble_select_stall_entry_f,
        in_data_in_46 => bubble_select_stall_entry_aa,
        in_data_in_47 => bubble_select_stall_entry_y,
        in_data_in_48 => bubble_select_stall_entry_z,
        in_data_in_49 => bubble_select_stall_entry_x,
        in_stall_in => SE_out_ethash_search_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_11,
        out_data_out_12 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_12,
        out_data_out_13 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_13,
        out_data_out_14 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_14,
        out_data_out_15 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_15,
        out_data_out_16 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_16,
        out_data_out_17 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_17,
        out_data_out_18 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_18,
        out_data_out_19 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_19,
        out_data_out_20 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_20,
        out_data_out_21 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_21,
        out_data_out_22 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_22,
        out_data_out_23 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_23,
        out_data_out_24 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_24,
        out_data_out_25 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_25,
        out_data_out_26 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_26,
        out_data_out_27 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_27,
        out_data_out_28 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_28,
        out_data_out_29 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_29,
        out_data_out_30 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_30,
        out_data_out_31 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_31,
        out_data_out_32 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_32,
        out_data_out_33 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_33,
        out_data_out_34 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_34,
        out_data_out_35 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_35,
        out_data_out_36 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_36,
        out_data_out_37 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_37,
        out_data_out_38 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_38,
        out_data_out_39 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_39,
        out_data_out_40 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_40,
        out_data_out_41 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_41,
        out_data_out_42 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_42,
        out_data_out_43 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_43,
        out_data_out_44 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_44,
        out_data_out_45 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_45,
        out_data_out_46 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_46,
        out_data_out_47 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_47,
        out_data_out_48 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_48,
        out_data_out_49 => ethash_search_B1_merge_reg_aunroll_x_out_data_out_49,
        out_stall_out => ethash_search_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => ethash_search_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_ethash_search_B1_merge_reg_aunroll_x(STALLENABLE,165)
    SE_out_ethash_search_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_ethash_search_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_ethash_search_B1_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_ethash_search_B1_merge_reg_aunroll_x_consumed0 <= (not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backStall) and SE_out_ethash_search_B1_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_ethash_search_B1_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_o_stall) and SE_out_ethash_search_B1_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_ethash_search_B1_merge_reg_aunroll_x_StallValid <= SE_out_ethash_search_B1_merge_reg_aunroll_x_backStall and SE_out_ethash_search_B1_merge_reg_aunroll_x_wireValid;
    SE_out_ethash_search_B1_merge_reg_aunroll_x_toReg0 <= SE_out_ethash_search_B1_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B1_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_search_B1_merge_reg_aunroll_x_toReg1 <= SE_out_ethash_search_B1_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B1_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_ethash_search_B1_merge_reg_aunroll_x_or0 <= SE_out_ethash_search_B1_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_search_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_ethash_search_B1_merge_reg_aunroll_x_consumed1 and SE_out_ethash_search_B1_merge_reg_aunroll_x_or0);
    SE_out_ethash_search_B1_merge_reg_aunroll_x_backStall <= SE_out_ethash_search_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_ethash_search_B1_merge_reg_aunroll_x_V0 <= SE_out_ethash_search_B1_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_ethash_search_B1_merge_reg_aunroll_x_V1 <= SE_out_ethash_search_B1_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B1_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_ethash_search_B1_merge_reg_aunroll_x_wireValid <= ethash_search_B1_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0(STALLENABLE,170)
    -- Valid signal propagation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_V0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_s_tv_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backStall and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN <= not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_v_s_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN and SE_out_ethash_search_B1_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backStall <= not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_v_s_0);
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "0") THEN
                SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_R_v_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_R_v_0 and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_s_tv_0;
            ELSE
                SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_R_v_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1(STALLENABLE,171)
    -- Valid signal propagation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_V0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_s_tv_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backStall and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN <= not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_v_s_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_V0;
    -- Backward Stall generation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backStall <= not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_v_s_0);
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "0") THEN
                SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_R_v_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_R_v_0 and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_s_tv_0;
            ELSE
                SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_R_v_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2(STALLENABLE,172)
    -- Valid signal propagation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_V0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_s_tv_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backStall and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN <= not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_v_s_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_V0;
    -- Backward Stall generation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backStall <= not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_v_s_0);
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "0") THEN
                SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_R_v_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_R_v_0 and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_s_tv_0;
            ELSE
                SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_R_v_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3(STALLENABLE,173)
    -- Valid signal propagation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_V0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_s_tv_0 <= SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_backStall and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN <= not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_v_s_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_V0;
    -- Backward Stall generation
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backStall <= not (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_v_s_0);
    SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "0") THEN
                SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_R_v_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_R_v_0 and SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_s_tv_0;
            ELSE
                SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_R_v_0 <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_ethash_search_B1_merge_reg_aunroll_x(BITJOIN,154)
    bubble_join_ethash_search_B1_merge_reg_aunroll_x_q <= ethash_search_B1_merge_reg_aunroll_x_out_data_out_49 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_48 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_47 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_46 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_45 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_44 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_43 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_42 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_41 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_40 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_39 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_38 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_37 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_36 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_35 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_34 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_33 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_32 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_31 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_30 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_29 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_28 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_27 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_26 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_25 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_24 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_23 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_22 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_21 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_20 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_19 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_18 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_17 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_16 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_15 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_14 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_13 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_12 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_11 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_10 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_9 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_8 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_7 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_6 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_5 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_4 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_3 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_2 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_1 & ethash_search_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_ethash_search_B1_merge_reg_aunroll_x(BITSELECT,155)
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(5 downto 0));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(37 downto 6));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(69 downto 38));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(101 downto 70));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(133 downto 102));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(165 downto 134));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(197 downto 166));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(229 downto 198));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(261 downto 230));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(293 downto 262));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(325 downto 294));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(357 downto 326));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(389 downto 358));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(421 downto 390));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(453 downto 422));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(485 downto 454));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(517 downto 486));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(549 downto 518));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(581 downto 550));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(613 downto 582));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(645 downto 614));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(677 downto 646));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(709 downto 678));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(741 downto 710));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(773 downto 742));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(837 downto 774));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(901 downto 838));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(965 downto 902));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1029 downto 966));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_ee <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1093 downto 1030));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_ff <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1157 downto 1094));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_gg <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1221 downto 1158));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_hh <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1285 downto 1222));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_ii <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1349 downto 1286));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_jj <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1413 downto 1350));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_kk <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1477 downto 1414));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_ll <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1541 downto 1478));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_mm <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1605 downto 1542));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_nn <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1669 downto 1606));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_oo <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1733 downto 1670));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_pp <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1797 downto 1734));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_qq <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1861 downto 1798));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_rr <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1925 downto 1862));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_ss <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(1989 downto 1926));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_tt <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(2053 downto 1990));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_uu <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(2117 downto 2054));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_vv <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(2149 downto 2118));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_ww <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(2181 downto 2150));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_xx <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(2213 downto 2182));
    bubble_select_ethash_search_B1_merge_reg_aunroll_x_yy <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B1_merge_reg_aunroll_x_q(2245 downto 2214));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x(BLACKBOX,7)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@5
    -- out out_c0_exit_1@5
    -- out out_c0_exit_2@5
    -- out out_c0_exit_3@5
    -- out out_c0_exit_4@5
    -- out out_c0_exit_5@5
    -- out out_c0_exit_6@5
    -- out out_c0_exit_7@5
    -- out out_c0_exit_8@5
    -- out out_c0_exit_9@5
    -- out out_c0_exit_10@5
    -- out out_c0_exit_11@5
    -- out out_c0_exit_12@5
    -- out out_c0_exit_13@5
    -- out out_c0_exit_14@5
    -- out out_c0_exit_15@5
    -- out out_c0_exit_16@5
    -- out out_c0_exit_17@5
    -- out out_c0_exit_18@5
    -- out out_c0_exit_19@5
    -- out out_c0_exit_20@5
    -- out out_c0_exit_21@5
    -- out out_c0_exit_22@5
    -- out out_c0_exit_23@5
    -- out out_c0_exit_24@5
    -- out out_c0_exit_25@5
    -- out out_c0_exit_26@5
    -- out out_c0_exit_27@5
    -- out out_c0_exit_28@5
    -- out out_c0_exit_29@5
    -- out out_c0_exit_30@5
    -- out out_c0_exit_31@5
    -- out out_c0_exit_32@5
    -- out out_c0_exit_33@5
    -- out out_c0_exit_34@5
    -- out out_c0_exit_35@5
    -- out out_c0_exit_36@5
    -- out out_c0_exit_37@5
    -- out out_c0_exit_38@5
    -- out out_c0_exit_39@5
    -- out out_c0_exit_40@5
    -- out out_c0_exit_41@5
    -- out out_c0_exit_42@5
    -- out out_c0_exit_43@5
    -- out out_c0_exit_44@5
    -- out out_c0_exit_45@5
    -- out out_c0_exit_46@5
    -- out out_c0_exit_47@5
    -- out out_c0_exit_48@5
    -- out out_c0_exit_49@5
    -- out out_c0_exit_50@5
    -- out out_c0_exit_51@5
    -- out out_c0_exit_52@5
    -- out out_o_stall@20000000
    -- out out_o_valid@5
    thei_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x : i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search
    PORT MAP (
        in_c0_eni47_0 => GND_q,
        in_c0_eni47_1 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_b,
        in_c0_eni47_2 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_vv,
        in_c0_eni47_3 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_uu,
        in_c0_eni47_4 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_ss,
        in_c0_eni47_5 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_rr,
        in_c0_eni47_6 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_qq,
        in_c0_eni47_7 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_y,
        in_c0_eni47_8 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_z,
        in_c0_eni47_9 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_w,
        in_c0_eni47_10 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_x,
        in_c0_eni47_11 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_pp,
        in_c0_eni47_12 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_oo,
        in_c0_eni47_13 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_nn,
        in_c0_eni47_14 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_mm,
        in_c0_eni47_15 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_u,
        in_c0_eni47_16 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_v,
        in_c0_eni47_17 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_ll,
        in_c0_eni47_18 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_kk,
        in_c0_eni47_19 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_jj,
        in_c0_eni47_20 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_ii,
        in_c0_eni47_21 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_s,
        in_c0_eni47_22 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_t,
        in_c0_eni47_23 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_tt,
        in_c0_eni47_24 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_hh,
        in_c0_eni47_25 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_gg,
        in_c0_eni47_26 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_ff,
        in_c0_eni47_27 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_dd,
        in_c0_eni47_28 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_ee,
        in_c0_eni47_29 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_cc,
        in_c0_eni47_30 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_bb,
        in_c0_eni47_31 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_aa,
        in_c0_eni47_32 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_c,
        in_c0_eni47_33 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_d,
        in_c0_eni47_34 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_e,
        in_c0_eni47_35 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_f,
        in_c0_eni47_36 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_g,
        in_c0_eni47_37 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_h,
        in_c0_eni47_38 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_i,
        in_c0_eni47_39 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_j,
        in_c0_eni47_40 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_k,
        in_c0_eni47_41 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_l,
        in_c0_eni47_42 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_m,
        in_c0_eni47_43 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_n,
        in_c0_eni47_44 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_o,
        in_c0_eni47_45 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_p,
        in_c0_eni47_46 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_q,
        in_c0_eni47_47 => bubble_select_ethash_search_B1_merge_reg_aunroll_x_r,
        in_i_stall => SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_backStall,
        in_i_valid => SE_out_ethash_search_B1_merge_reg_aunroll_x_V1,
        in_isolate => in_isolate,
        out_c0_exit_1 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_1,
        out_c0_exit_2 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_2,
        out_c0_exit_3 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_3,
        out_c0_exit_4 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_4,
        out_c0_exit_5 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_5,
        out_c0_exit_6 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_6,
        out_c0_exit_7 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_7,
        out_c0_exit_8 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_8,
        out_c0_exit_9 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_9,
        out_c0_exit_10 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_10,
        out_c0_exit_11 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_11,
        out_c0_exit_12 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_12,
        out_c0_exit_13 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_13,
        out_c0_exit_14 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_14,
        out_c0_exit_15 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_15,
        out_c0_exit_16 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_16,
        out_c0_exit_17 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_17,
        out_c0_exit_18 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_18,
        out_c0_exit_19 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_19,
        out_c0_exit_20 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_20,
        out_c0_exit_21 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_21,
        out_c0_exit_22 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_22,
        out_c0_exit_23 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_23,
        out_c0_exit_24 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_24,
        out_c0_exit_25 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_25,
        out_c0_exit_26 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_26,
        out_c0_exit_27 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_27,
        out_c0_exit_28 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_28,
        out_c0_exit_29 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_29,
        out_c0_exit_30 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_30,
        out_c0_exit_31 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_31,
        out_c0_exit_32 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_32,
        out_c0_exit_33 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_33,
        out_c0_exit_34 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_34,
        out_c0_exit_35 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_35,
        out_c0_exit_36 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_36,
        out_c0_exit_37 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_37,
        out_c0_exit_38 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_38,
        out_c0_exit_39 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_39,
        out_c0_exit_40 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_40,
        out_c0_exit_41 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_41,
        out_c0_exit_42 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_42,
        out_c0_exit_43 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_43,
        out_c0_exit_44 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_44,
        out_c0_exit_45 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_45,
        out_c0_exit_46 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_46,
        out_c0_exit_47 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_47,
        out_c0_exit_48 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_48,
        out_c0_exit_49 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_49,
        out_c0_exit_50 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_50,
        out_c0_exit_51 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_51,
        out_c0_exit_52 => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_52,
        out_o_stall => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x(STALLENABLE,167)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_V0 <= SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_backStall <= in_stall_in or not (SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_and0 <= i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_wireValid <= SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_V0 and SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_and0;

    -- redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_0(REG,97)
    redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_p);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_1(REG,98)
    redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_1_q <= STD_LOGIC_VECTOR(redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_2(REG,99)
    redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_2_q <= STD_LOGIC_VECTOR(redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_3(REG,100)
    redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_3_q <= STD_LOGIC_VECTOR(redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_0(REG,89)
    redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_n);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_1(REG,90)
    redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_1_q <= STD_LOGIC_VECTOR(redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_2(REG,91)
    redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_2_q <= STD_LOGIC_VECTOR(redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_3(REG,92)
    redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_3_q <= STD_LOGIC_VECTOR(redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_0(REG,81)
    redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_l);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_1(REG,82)
    redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_1_q <= STD_LOGIC_VECTOR(redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_2(REG,83)
    redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_2_q <= STD_LOGIC_VECTOR(redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_3(REG,84)
    redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_3_q <= STD_LOGIC_VECTOR(redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_0(REG,73)
    redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_j);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_1(REG,74)
    redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_1_q <= STD_LOGIC_VECTOR(redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_2(REG,75)
    redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_2_q <= STD_LOGIC_VECTOR(redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_3(REG,76)
    redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_3_q <= STD_LOGIC_VECTOR(redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_0(REG,65)
    redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_1(REG,66)
    redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_1_q <= STD_LOGIC_VECTOR(redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_2(REG,67)
    redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_2_q <= STD_LOGIC_VECTOR(redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_3(REG,68)
    redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_3_q <= STD_LOGIC_VECTOR(redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_0(REG,57)
    redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_1(REG,58)
    redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_1_q <= STD_LOGIC_VECTOR(redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_2(REG,59)
    redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_2_q <= STD_LOGIC_VECTOR(redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_3(REG,60)
    redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_3_q <= STD_LOGIC_VECTOR(redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_0(REG,137)
    redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_z);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_1(REG,138)
    redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_1_q <= STD_LOGIC_VECTOR(redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_2(REG,139)
    redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_2_q <= STD_LOGIC_VECTOR(redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_3(REG,140)
    redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_3_q <= STD_LOGIC_VECTOR(redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_0(REG,129)
    redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_x);
            END IF;
        END IF;
    END PROCESS;

    -- redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_1(REG,130)
    redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_1_q <= STD_LOGIC_VECTOR(redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_2(REG,131)
    redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_2_q <= STD_LOGIC_VECTOR(redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_3(REG,132)
    redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_3_q <= STD_LOGIC_VECTOR(redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_0(REG,121)
    redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_v);
            END IF;
        END IF;
    END PROCESS;

    -- redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_1(REG,122)
    redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_1_q <= STD_LOGIC_VECTOR(redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_2(REG,123)
    redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_2_q <= STD_LOGIC_VECTOR(redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_3(REG,124)
    redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_3_q <= STD_LOGIC_VECTOR(redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_0(REG,113)
    redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_t);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_1(REG,114)
    redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_1_q <= STD_LOGIC_VECTOR(redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_2(REG,115)
    redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_2_q <= STD_LOGIC_VECTOR(redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_3(REG,116)
    redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_3_q <= STD_LOGIC_VECTOR(redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_0(REG,105)
    redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_r);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_1(REG,106)
    redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_1_q <= STD_LOGIC_VECTOR(redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_2(REG,107)
    redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_2_q <= STD_LOGIC_VECTOR(redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_3(REG,108)
    redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_3_q <= STD_LOGIC_VECTOR(redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_0(REG,49)
    redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_1(REG,50)
    redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_1_q <= STD_LOGIC_VECTOR(redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_2(REG,51)
    redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_2_q <= STD_LOGIC_VECTOR(redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_3(REG,52)
    redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_3_q <= STD_LOGIC_VECTOR(redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_0(REG,101)
    redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_1(REG,102)
    redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_1_q <= STD_LOGIC_VECTOR(redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_2(REG,103)
    redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_2_q <= STD_LOGIC_VECTOR(redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_3(REG,104)
    redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_3_q <= STD_LOGIC_VECTOR(redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_0(REG,93)
    redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_o);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_1(REG,94)
    redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_1_q <= STD_LOGIC_VECTOR(redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_2(REG,95)
    redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_2_q <= STD_LOGIC_VECTOR(redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_3(REG,96)
    redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_3_q <= STD_LOGIC_VECTOR(redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_0(REG,85)
    redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_m);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_1(REG,86)
    redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_1_q <= STD_LOGIC_VECTOR(redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_2(REG,87)
    redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_2_q <= STD_LOGIC_VECTOR(redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_3(REG,88)
    redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_3_q <= STD_LOGIC_VECTOR(redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_0(REG,77)
    redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_k);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_1(REG,78)
    redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_1_q <= STD_LOGIC_VECTOR(redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_2(REG,79)
    redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_2_q <= STD_LOGIC_VECTOR(redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_3(REG,80)
    redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_3_q <= STD_LOGIC_VECTOR(redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_0(REG,69)
    redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_i);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_1(REG,70)
    redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_1_q <= STD_LOGIC_VECTOR(redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_2(REG,71)
    redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_2_q <= STD_LOGIC_VECTOR(redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_3(REG,72)
    redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_3_q <= STD_LOGIC_VECTOR(redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_0(REG,61)
    redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_1(REG,62)
    redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_1_q <= STD_LOGIC_VECTOR(redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_2(REG,63)
    redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_2_q <= STD_LOGIC_VECTOR(redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_3(REG,64)
    redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_3_q <= STD_LOGIC_VECTOR(redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_0(REG,53)
    redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_1(REG,54)
    redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_1_q <= STD_LOGIC_VECTOR(redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_2(REG,55)
    redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_2_q <= STD_LOGIC_VECTOR(redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_3(REG,56)
    redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_3_q <= STD_LOGIC_VECTOR(redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_0(REG,133)
    redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_y);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_1(REG,134)
    redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_1_q <= STD_LOGIC_VECTOR(redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_2(REG,135)
    redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_2_q <= STD_LOGIC_VECTOR(redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_3(REG,136)
    redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_3_q <= STD_LOGIC_VECTOR(redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_0(REG,125)
    redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_w);
            END IF;
        END IF;
    END PROCESS;

    -- redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_1(REG,126)
    redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_1_q <= STD_LOGIC_VECTOR(redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_2(REG,127)
    redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_2_q <= STD_LOGIC_VECTOR(redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_3(REG,128)
    redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_3_q <= STD_LOGIC_VECTOR(redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_0(REG,117)
    redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_u);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_1(REG,118)
    redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_1_q <= STD_LOGIC_VECTOR(redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_2(REG,119)
    redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_2_q <= STD_LOGIC_VECTOR(redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_3(REG,120)
    redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_3_q <= STD_LOGIC_VECTOR(redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_0(REG,109)
    redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_s);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_1(REG,110)
    redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_1_q <= STD_LOGIC_VECTOR(redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_2(REG,111)
    redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_2_q <= STD_LOGIC_VECTOR(redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_3(REG,112)
    redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_3_q <= STD_LOGIC_VECTOR(redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0(REG,45)
    redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1(REG,46)
    redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_q <= STD_LOGIC_VECTOR(redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2(REG,47)
    redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_q <= STD_LOGIC_VECTOR(redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3(REG,48)
    redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_q <= STD_LOGIC_VECTOR(redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_0(REG,145)
    redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_xx);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_1(REG,146)
    redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_1_q <= STD_LOGIC_VECTOR(redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_2(REG,147)
    redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_2_q <= STD_LOGIC_VECTOR(redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_3(REG,148)
    redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_3_q <= STD_LOGIC_VECTOR(redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_0(REG,141)
    redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_ww);
            END IF;
        END IF;
    END PROCESS;

    -- redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_1(REG,142)
    redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_1_q <= STD_LOGIC_VECTOR(redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_2(REG,143)
    redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_2_q <= STD_LOGIC_VECTOR(redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_3(REG,144)
    redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_3_q <= STD_LOGIC_VECTOR(redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_0(REG,149)
    redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_0_backEN = "1") THEN
                redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B1_merge_reg_aunroll_x_yy);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_1(REG,150)
    redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_1_backEN = "1") THEN
                redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_1_q <= STD_LOGIC_VECTOR(redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_2(REG,151)
    redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_2_backEN = "1") THEN
                redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_2_q <= STD_LOGIC_VECTOR(redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_3(REG,152)
    redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_backEN = "1") THEN
                redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_3_q <= STD_LOGIC_VECTOR(redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x(BITJOIN,157)
    bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q <= i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_52 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_51 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_50 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_49 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_48 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_47 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_46 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_45 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_44 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_43 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_42 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_41 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_40 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_39 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_38 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_37 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_36 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_35 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_34 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_33 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_32 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_31 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_30 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_29 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_28 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_27 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_26 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_25 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_24 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_23 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_22 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_21 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_20 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_19 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_18 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_17 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_16 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_15 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_14 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_13 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_12 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_11 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_10 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_9 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_8 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_7 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_6 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_5 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_4 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_3 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_2 & i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x(BITSELECT,158)
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(64 downto 1));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(128 downto 65));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(192 downto 129));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(198 downto 193));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(230 downto 199));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(262 downto 231));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(294 downto 263));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(326 downto 295));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(358 downto 327));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(390 downto 359));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(422 downto 391));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(454 downto 423));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(486 downto 455));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(518 downto 487));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(550 downto 519));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(582 downto 551));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(614 downto 583));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(646 downto 615));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(678 downto 647));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(710 downto 679));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(742 downto 711));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(774 downto 743));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(806 downto 775));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(838 downto 807));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(870 downto 839));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(902 downto 871));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(934 downto 903));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(966 downto 935));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ee <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1030 downto 967));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ff <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1094 downto 1031));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_gg <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1158 downto 1095));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_hh <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1222 downto 1159));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ii <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1286 downto 1223));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_jj <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1350 downto 1287));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_kk <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1414 downto 1351));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ll <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1478 downto 1415));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_mm <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1542 downto 1479));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_nn <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1606 downto 1543));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_oo <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1670 downto 1607));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_pp <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1734 downto 1671));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_qq <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1798 downto 1735));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_rr <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1862 downto 1799));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ss <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1926 downto 1863));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_tt <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(1990 downto 1927));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_uu <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(2054 downto 1991));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_vv <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(2118 downto 2055));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ww <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(2182 downto 2119));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_xx <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(2246 downto 2183));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_yy <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(2310 downto 2247));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_zz <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(2342 downto 2311));
    bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_1 <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q(2343 downto 2343));

    -- dupName_0_sync_out_x(GPOUT,5)@5
    out_c0_exe1 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_b;
    out_c0_exe10 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_k;
    out_c0_exe11 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_l;
    out_c0_exe12 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_m;
    out_c0_exe13 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_n;
    out_c0_exe14 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_o;
    out_c0_exe15 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_p;
    out_c0_exe16 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_q;
    out_c0_exe17 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_r;
    out_c0_exe18 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_s;
    out_c0_exe19 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_t;
    out_c0_exe2 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_c;
    out_c0_exe20 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_u;
    out_c0_exe21 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_v;
    out_c0_exe22 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_w;
    out_c0_exe23 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_x;
    out_c0_exe24 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_y;
    out_c0_exe25 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_z;
    out_c0_exe26 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_aa;
    out_c0_exe27 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_bb;
    out_c0_exe28 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_cc;
    out_c0_exe29 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_dd;
    out_c0_exe3 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_d;
    out_c0_exe30 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ee;
    out_c0_exe31 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ff;
    out_c0_exe32 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_gg;
    out_c0_exe33 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_hh;
    out_c0_exe34 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ii;
    out_c0_exe35 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_jj;
    out_c0_exe36 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_kk;
    out_c0_exe37 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ll;
    out_c0_exe38 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_mm;
    out_c0_exe39 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_nn;
    out_c0_exe4 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_e;
    out_c0_exe40 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_oo;
    out_c0_exe41 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_pp;
    out_c0_exe42 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_qq;
    out_c0_exe43 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_rr;
    out_c0_exe44 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ss;
    out_c0_exe45 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_tt;
    out_c0_exe46 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_uu;
    out_c0_exe47 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_vv;
    out_c0_exe48 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_ww;
    out_c0_exe49 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_xx;
    out_c0_exe5 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_f;
    out_c0_exe50 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_yy;
    out_c0_exe51 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_zz;
    out_c0_exe52 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_1;
    out_c0_exe6 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_g;
    out_c0_exe7 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_h;
    out_c0_exe8 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_i;
    out_c0_exe9 <= bubble_select_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_j;
    out_global_id_0197 <= redist26_ethash_search_B1_merge_reg_aunroll_x_out_data_out_49_4_3_q;
    out_l_grpid_08 <= redist24_ethash_search_B1_merge_reg_aunroll_x_out_data_out_47_4_3_q;
    out_l_grpid_0_addr13 <= redist25_ethash_search_B1_merge_reg_aunroll_x_out_data_out_48_4_3_q;
    out_scalarizer_0 <= redist0_ethash_search_B1_merge_reg_aunroll_x_out_data_out_1_4_3_q;
    out_scalarizer_01001 <= redist16_ethash_search_B1_merge_reg_aunroll_x_out_data_out_17_4_3_q;
    out_scalarizer_01003 <= redist18_ethash_search_B1_merge_reg_aunroll_x_out_data_out_19_4_3_q;
    out_scalarizer_01005 <= redist20_ethash_search_B1_merge_reg_aunroll_x_out_data_out_21_4_3_q;
    out_scalarizer_01007 <= redist22_ethash_search_B1_merge_reg_aunroll_x_out_data_out_23_4_3_q;
    out_scalarizer_0987 <= redist2_ethash_search_B1_merge_reg_aunroll_x_out_data_out_3_4_3_q;
    out_scalarizer_0989 <= redist4_ethash_search_B1_merge_reg_aunroll_x_out_data_out_5_4_3_q;
    out_scalarizer_0991 <= redist6_ethash_search_B1_merge_reg_aunroll_x_out_data_out_7_4_3_q;
    out_scalarizer_0993 <= redist8_ethash_search_B1_merge_reg_aunroll_x_out_data_out_9_4_3_q;
    out_scalarizer_0995 <= redist10_ethash_search_B1_merge_reg_aunroll_x_out_data_out_11_4_3_q;
    out_scalarizer_0997 <= redist12_ethash_search_B1_merge_reg_aunroll_x_out_data_out_13_4_3_q;
    out_scalarizer_0999 <= redist14_ethash_search_B1_merge_reg_aunroll_x_out_data_out_15_4_3_q;
    out_scalarizer_1 <= redist1_ethash_search_B1_merge_reg_aunroll_x_out_data_out_2_4_3_q;
    out_scalarizer_11000 <= redist15_ethash_search_B1_merge_reg_aunroll_x_out_data_out_16_4_3_q;
    out_scalarizer_11002 <= redist17_ethash_search_B1_merge_reg_aunroll_x_out_data_out_18_4_3_q;
    out_scalarizer_11004 <= redist19_ethash_search_B1_merge_reg_aunroll_x_out_data_out_20_4_3_q;
    out_scalarizer_11006 <= redist21_ethash_search_B1_merge_reg_aunroll_x_out_data_out_22_4_3_q;
    out_scalarizer_11008 <= redist23_ethash_search_B1_merge_reg_aunroll_x_out_data_out_24_4_3_q;
    out_scalarizer_1988 <= redist3_ethash_search_B1_merge_reg_aunroll_x_out_data_out_4_4_3_q;
    out_scalarizer_1990 <= redist5_ethash_search_B1_merge_reg_aunroll_x_out_data_out_6_4_3_q;
    out_scalarizer_1992 <= redist7_ethash_search_B1_merge_reg_aunroll_x_out_data_out_8_4_3_q;
    out_scalarizer_1994 <= redist9_ethash_search_B1_merge_reg_aunroll_x_out_data_out_10_4_3_q;
    out_scalarizer_1996 <= redist11_ethash_search_B1_merge_reg_aunroll_x_out_data_out_12_4_3_q;
    out_scalarizer_1998 <= redist13_ethash_search_B1_merge_reg_aunroll_x_out_data_out_14_4_3_q;
    out_valid_out <= SE_out_i_sfc_c0_for_cond_i_outer_ethash_search_c0_enter_ethash_search_aunroll_x_V0;

    -- sync_out(GPOUT,17)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
