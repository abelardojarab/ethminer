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

-- VHDL created from bb_ethash_search_B1
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

entity bb_ethash_search_B1 is
    port (
        in_arrayidx10_i_i803_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx10_i_i803_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx12_i_i806_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx12_i_i806_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx14_i_i809_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx14_i_i809_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx16_i_i812_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx16_i_i812_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx1_i_i856_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx1_i_i856_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx20_i_i817_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx20_i_i817_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx22_i_i820_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx22_i_i820_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx24_i_i823_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx24_i_i823_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx26_i_i826_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx26_i_i826_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx2_i_i795_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx2_i_i795_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30_i_i871_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30_i_i871_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx32_i_i834_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx32_i_i834_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx34_i_i837_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx34_i_i837_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_i_i840_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_i_i840_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx39_i_i843_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx39_i_i843_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx40_i_i845_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx40_i_i845_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx42_i_i848_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx42_i_i848_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx44_i_i851_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx44_i_i851_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx46_i_i854_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx46_i_i854_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx4_i_i797_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx4_i_i797_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx6_i_i799_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx6_i_i799_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_encoder_ethash_search_B1_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_fpgaindvars_iv15_0 : in std_logic_vector(5 downto 0);  -- ufix6
        in_fpgaindvars_iv15_1 : in std_logic_vector(5 downto 0);  -- ufix6
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0197_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0197_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_08_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_08_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr13_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr13_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i_ph_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i_ph_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01001_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01001_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01003_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01003_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01005_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01005_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01007_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01007_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0987_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0987_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0989_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0989_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0991_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0991_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0993_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0993_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0995_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0995_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0997_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0997_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0999_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0999_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11000_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11000_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11002_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11002_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11004_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11004_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11006_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11006_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1988_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1988_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1990_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1990_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1992_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1992_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1994_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1994_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1996_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1996_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1998_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1998_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B1;

architecture normal of bb_ethash_search_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_search_B1_stall_region is
        port (
            in_arrayidx10_i_i803 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx12_i_i806 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i809 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i812 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx1_i_i856 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx20_i_i817 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i820 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i823 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i826 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i795 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i871 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i834 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i837 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i840 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx39_i_i843 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i845 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i848 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i851 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i854 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i797 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i799 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_fpgaindvars_iv15 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_global_id_0197 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_08 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_ph : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01001 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01003 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01005 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01007 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0987 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0989 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0991 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0993 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0995 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0997 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0999 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11000 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11002 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11004 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11006 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1988 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1990 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1992 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1994 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1996 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1998 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe42 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe43 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe44 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe49 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exe50 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe52 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_0197 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_08 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01001 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01003 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01005 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01007 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0987 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0989 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0991 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0993 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0995 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0997 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0999 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11000 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11002 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11004 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11006 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1988 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1990 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1992 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1994 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1996 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1998 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B1_branch is
        port (
            in_c0_exe1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe37 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe38 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe41 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe42 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe43 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe44 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe45 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe46 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe47 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe48 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe49 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe5 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_c0_exe50 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe51 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe52 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0197 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_08 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01001 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01003 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01005 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01007 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0987 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0989 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0991 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0993 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0995 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0997 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0999 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11000 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11002 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11004 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11006 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1988 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1990 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1992 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1994 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1996 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1998 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe42 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe43 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe44 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe49 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exe50 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_0197 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_08 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01001 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01003 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01005 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01007 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0987 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0989 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0991 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0993 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0995 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0997 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0999 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11000 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11002 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11004 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11006 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1988 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1990 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1992 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1994 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1996 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1998 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B1_merge is
        port (
            in_arrayidx10_i_i803_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx10_i_i803_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx12_i_i806_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx12_i_i806_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i809_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i809_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i812_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i812_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx1_i_i856_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx1_i_i856_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx20_i_i817_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx20_i_i817_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i820_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i820_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i823_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i823_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i826_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i826_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i795_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i795_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i871_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i871_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i834_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i834_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i837_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i837_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i840_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i840_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx39_i_i843_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx39_i_i843_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i845_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i845_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i848_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i848_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i851_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i851_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i854_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i854_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i797_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i797_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i799_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i799_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_encoder_ethash_search_B1_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_fpgaindvars_iv15_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_fpgaindvars_iv15_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_global_id_0197_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0197_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_08_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_08_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr13_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr13_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_ph_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_ph_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01001_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01001_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01003_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01003_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01005_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01005_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01007_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01007_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0987_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0987_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0989_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0989_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0991_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0991_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0993_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0993_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0995_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0995_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0997_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0997_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0999_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0999_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11000_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11000_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11002_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11002_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11004_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11004_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11006_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11006_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1988_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1988_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1990_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1990_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1992_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1992_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1994_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1994_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1996_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1996_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1998_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1998_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx10_i_i803 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx12_i_i806 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx14_i_i809 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx16_i_i812 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx1_i_i856 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx20_i_i817 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx22_i_i820 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx24_i_i823 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx26_i_i826 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx2_i_i795 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx30_i_i871 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx32_i_i834 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx34_i_i837 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx36_i_i840 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx39_i_i843 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx40_i_i845 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx42_i_i848 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx44_i_i851 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx46_i_i854 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx4_i_i797 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx6_i_i799 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_fpgaindvars_iv15 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_global_id_0197 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_08 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_r_0_i_ph : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01001 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01003 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01005 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01007 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0987 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0989 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0991 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0993 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0995 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0997 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0999 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11000 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11002 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11004 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11006 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1988 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1990 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1992 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1994 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1996 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1998 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_capacity_FIFO is
        port (
            in_data_in : in std_logic_vector(2245 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(2245 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_4_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_5_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_6_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_7_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_8_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_9_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_10_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_11_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_12_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_13_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_14_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_15_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_16_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_17_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_18_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_19_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_20_data_out_select_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_21_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_22_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_23_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_24_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_25_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_26_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_27_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_28_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_29_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_30_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_31_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_32_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_33_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_34_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_35_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_36_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_37_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_38_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_39_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_40_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_41_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_42_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_43_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_44_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_45_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_46_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_47_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_48_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num0_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num10_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num11_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num12_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num13_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num14_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num15_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num16_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num17_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num18_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num19_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num1_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num20_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num21_cast_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal num22_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num23_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num24_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num25_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num26_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num27_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num28_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num29_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num2_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num30_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num31_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num32_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num33_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num34_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num35_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num36_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num37_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num38_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num39_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num3_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num40_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num41_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num42_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num43_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num44_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num45_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num46_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num47_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num48_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num49_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num4_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num5_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num6_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num7_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num8_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num9_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal aggregateWireOut_join_q : STD_LOGIC_VECTOR (2245 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe32 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe33 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe34 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe35 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe36 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe37 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe38 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe39 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe40 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe41 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe42 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe43 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe44 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe45 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe46 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe47 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe48 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe49 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe5 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe50 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe51 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe52 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_global_id_0197 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_l_grpid_08 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_l_grpid_0_addr13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_01001 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_01003 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_01005 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_01007 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_0987 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_0989 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_0991 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_0993 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_0995 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_0997 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_0999 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_11000 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_11002 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_11004 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_11006 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_11008 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_1988 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_1990 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_1992 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_1994 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_1996 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_scalarizer_1998 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal data_out_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_branch_out_c0_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe25 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe26 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe27 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe28 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe29 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe3 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe30 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe31 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe32 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe33 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe34 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe35 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe36 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe37 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe38 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe39 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe4 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe40 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe41 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe42 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe43 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe44 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe45 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe46 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe47 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe48 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe49 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe5 : STD_LOGIC_VECTOR (5 downto 0);
    signal ethash_search_B1_branch_out_c0_exe50 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_branch_out_c0_exe51 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_global_id_0197 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_l_grpid_08 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_l_grpid_0_addr13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_01001 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_01003 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_01005 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_01007 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_0987 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_0989 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_0991 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_0993 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_0995 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_0997 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_0999 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_11000 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_11002 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_11004 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_11006 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_11008 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_1988 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_1990 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_1992 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_1994 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_1996 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_scalarizer_1998 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_merge_out_arrayidx10_i_i803 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx12_i_i806 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx14_i_i809 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx16_i_i812 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx1_i_i856 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx20_i_i817 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx22_i_i820 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx24_i_i823 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx26_i_i826 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx2_i_i795 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx30_i_i871 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx32_i_i834 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx34_i_i837 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx36_i_i840 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx39_i_i843 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx40_i_i845 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx42_i_i848 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx44_i_i851 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx46_i_i854 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx4_i_i797 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_arrayidx6_i_i799 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B1_merge_out_fpgaindvars_iv15 : STD_LOGIC_VECTOR (5 downto 0);
    signal ethash_search_B1_merge_out_global_id_0197 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_l_grpid_08 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_l_grpid_0_addr13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_r_0_i_ph : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_01001 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_01003 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_01005 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_01007 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_0987 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_0989 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_0991 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_0993 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_0995 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_0997 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_0999 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_11000 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_11002 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_11004 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_11006 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_11008 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_1988 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_1990 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_1992 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_1994 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_1996 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_scalarizer_1998 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_out_data_out : STD_LOGIC_VECTOR (2245 downto 0);
    signal loop_capacity_FIFO_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_search_B1_merge(BLACKBOX,105)
    theethash_search_B1_merge : ethash_search_B1_merge
    PORT MAP (
        in_arrayidx10_i_i803_0 => in_arrayidx10_i_i803_0,
        in_arrayidx10_i_i803_1 => in_arrayidx10_i_i803_1,
        in_arrayidx12_i_i806_0 => in_arrayidx12_i_i806_0,
        in_arrayidx12_i_i806_1 => in_arrayidx12_i_i806_1,
        in_arrayidx14_i_i809_0 => in_arrayidx14_i_i809_0,
        in_arrayidx14_i_i809_1 => in_arrayidx14_i_i809_1,
        in_arrayidx16_i_i812_0 => in_arrayidx16_i_i812_0,
        in_arrayidx16_i_i812_1 => in_arrayidx16_i_i812_1,
        in_arrayidx1_i_i856_0 => in_arrayidx1_i_i856_0,
        in_arrayidx1_i_i856_1 => in_arrayidx1_i_i856_1,
        in_arrayidx20_i_i817_0 => in_arrayidx20_i_i817_0,
        in_arrayidx20_i_i817_1 => in_arrayidx20_i_i817_1,
        in_arrayidx22_i_i820_0 => in_arrayidx22_i_i820_0,
        in_arrayidx22_i_i820_1 => in_arrayidx22_i_i820_1,
        in_arrayidx24_i_i823_0 => in_arrayidx24_i_i823_0,
        in_arrayidx24_i_i823_1 => in_arrayidx24_i_i823_1,
        in_arrayidx26_i_i826_0 => in_arrayidx26_i_i826_0,
        in_arrayidx26_i_i826_1 => in_arrayidx26_i_i826_1,
        in_arrayidx2_i_i795_0 => in_arrayidx2_i_i795_0,
        in_arrayidx2_i_i795_1 => in_arrayidx2_i_i795_1,
        in_arrayidx30_i_i871_0 => in_arrayidx30_i_i871_0,
        in_arrayidx30_i_i871_1 => in_arrayidx30_i_i871_1,
        in_arrayidx32_i_i834_0 => in_arrayidx32_i_i834_0,
        in_arrayidx32_i_i834_1 => in_arrayidx32_i_i834_1,
        in_arrayidx34_i_i837_0 => in_arrayidx34_i_i837_0,
        in_arrayidx34_i_i837_1 => in_arrayidx34_i_i837_1,
        in_arrayidx36_i_i840_0 => in_arrayidx36_i_i840_0,
        in_arrayidx36_i_i840_1 => in_arrayidx36_i_i840_1,
        in_arrayidx39_i_i843_0 => in_arrayidx39_i_i843_0,
        in_arrayidx39_i_i843_1 => in_arrayidx39_i_i843_1,
        in_arrayidx40_i_i845_0 => in_arrayidx40_i_i845_0,
        in_arrayidx40_i_i845_1 => in_arrayidx40_i_i845_1,
        in_arrayidx42_i_i848_0 => in_arrayidx42_i_i848_0,
        in_arrayidx42_i_i848_1 => in_arrayidx42_i_i848_1,
        in_arrayidx44_i_i851_0 => in_arrayidx44_i_i851_0,
        in_arrayidx44_i_i851_1 => in_arrayidx44_i_i851_1,
        in_arrayidx46_i_i854_0 => in_arrayidx46_i_i854_0,
        in_arrayidx46_i_i854_1 => in_arrayidx46_i_i854_1,
        in_arrayidx4_i_i797_0 => in_arrayidx4_i_i797_0,
        in_arrayidx4_i_i797_1 => in_arrayidx4_i_i797_1,
        in_arrayidx6_i_i799_0 => in_arrayidx6_i_i799_0,
        in_arrayidx6_i_i799_1 => in_arrayidx6_i_i799_1,
        in_encoder_ethash_search_B1_merge_priority_encoder_workgroup_size => in_encoder_ethash_search_B1_merge_priority_encoder_workgroup_size,
        in_fpgaindvars_iv15_0 => in_fpgaindvars_iv15_0,
        in_fpgaindvars_iv15_1 => in_fpgaindvars_iv15_1,
        in_global_id_0197_0 => in_global_id_0197_0,
        in_global_id_0197_1 => in_global_id_0197_1,
        in_l_grpid_08_0 => in_l_grpid_08_0,
        in_l_grpid_08_1 => in_l_grpid_08_1,
        in_l_grpid_0_addr13_0 => in_l_grpid_0_addr13_0,
        in_l_grpid_0_addr13_1 => in_l_grpid_0_addr13_1,
        in_r_0_i_ph_0 => in_r_0_i_ph_0,
        in_r_0_i_ph_1 => in_r_0_i_ph_1,
        in_scalarizer_01001_0 => in_scalarizer_01001_0,
        in_scalarizer_01001_1 => in_scalarizer_01001_1,
        in_scalarizer_01003_0 => in_scalarizer_01003_0,
        in_scalarizer_01003_1 => in_scalarizer_01003_1,
        in_scalarizer_01005_0 => in_scalarizer_01005_0,
        in_scalarizer_01005_1 => in_scalarizer_01005_1,
        in_scalarizer_01007_0 => in_scalarizer_01007_0,
        in_scalarizer_01007_1 => in_scalarizer_01007_1,
        in_scalarizer_0987_0 => in_scalarizer_0987_0,
        in_scalarizer_0987_1 => in_scalarizer_0987_1,
        in_scalarizer_0989_0 => in_scalarizer_0989_0,
        in_scalarizer_0989_1 => in_scalarizer_0989_1,
        in_scalarizer_0991_0 => in_scalarizer_0991_0,
        in_scalarizer_0991_1 => in_scalarizer_0991_1,
        in_scalarizer_0993_0 => in_scalarizer_0993_0,
        in_scalarizer_0993_1 => in_scalarizer_0993_1,
        in_scalarizer_0995_0 => in_scalarizer_0995_0,
        in_scalarizer_0995_1 => in_scalarizer_0995_1,
        in_scalarizer_0997_0 => in_scalarizer_0997_0,
        in_scalarizer_0997_1 => in_scalarizer_0997_1,
        in_scalarizer_0999_0 => in_scalarizer_0999_0,
        in_scalarizer_0999_1 => in_scalarizer_0999_1,
        in_scalarizer_0_0 => in_scalarizer_0_0,
        in_scalarizer_0_1 => in_scalarizer_0_1,
        in_scalarizer_11000_0 => in_scalarizer_11000_0,
        in_scalarizer_11000_1 => in_scalarizer_11000_1,
        in_scalarizer_11002_0 => in_scalarizer_11002_0,
        in_scalarizer_11002_1 => in_scalarizer_11002_1,
        in_scalarizer_11004_0 => in_scalarizer_11004_0,
        in_scalarizer_11004_1 => in_scalarizer_11004_1,
        in_scalarizer_11006_0 => in_scalarizer_11006_0,
        in_scalarizer_11006_1 => in_scalarizer_11006_1,
        in_scalarizer_11008_0 => in_scalarizer_11008_0,
        in_scalarizer_11008_1 => in_scalarizer_11008_1,
        in_scalarizer_1988_0 => in_scalarizer_1988_0,
        in_scalarizer_1988_1 => in_scalarizer_1988_1,
        in_scalarizer_1990_0 => in_scalarizer_1990_0,
        in_scalarizer_1990_1 => in_scalarizer_1990_1,
        in_scalarizer_1992_0 => in_scalarizer_1992_0,
        in_scalarizer_1992_1 => in_scalarizer_1992_1,
        in_scalarizer_1994_0 => in_scalarizer_1994_0,
        in_scalarizer_1994_1 => in_scalarizer_1994_1,
        in_scalarizer_1996_0 => in_scalarizer_1996_0,
        in_scalarizer_1996_1 => in_scalarizer_1996_1,
        in_scalarizer_1998_0 => in_scalarizer_1998_0,
        in_scalarizer_1998_1 => in_scalarizer_1998_1,
        in_scalarizer_1_0 => in_scalarizer_1_0,
        in_scalarizer_1_1 => in_scalarizer_1_1,
        in_stall_in => loop_capacity_FIFO_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_arrayidx10_i_i803 => ethash_search_B1_merge_out_arrayidx10_i_i803,
        out_arrayidx12_i_i806 => ethash_search_B1_merge_out_arrayidx12_i_i806,
        out_arrayidx14_i_i809 => ethash_search_B1_merge_out_arrayidx14_i_i809,
        out_arrayidx16_i_i812 => ethash_search_B1_merge_out_arrayidx16_i_i812,
        out_arrayidx1_i_i856 => ethash_search_B1_merge_out_arrayidx1_i_i856,
        out_arrayidx20_i_i817 => ethash_search_B1_merge_out_arrayidx20_i_i817,
        out_arrayidx22_i_i820 => ethash_search_B1_merge_out_arrayidx22_i_i820,
        out_arrayidx24_i_i823 => ethash_search_B1_merge_out_arrayidx24_i_i823,
        out_arrayidx26_i_i826 => ethash_search_B1_merge_out_arrayidx26_i_i826,
        out_arrayidx2_i_i795 => ethash_search_B1_merge_out_arrayidx2_i_i795,
        out_arrayidx30_i_i871 => ethash_search_B1_merge_out_arrayidx30_i_i871,
        out_arrayidx32_i_i834 => ethash_search_B1_merge_out_arrayidx32_i_i834,
        out_arrayidx34_i_i837 => ethash_search_B1_merge_out_arrayidx34_i_i837,
        out_arrayidx36_i_i840 => ethash_search_B1_merge_out_arrayidx36_i_i840,
        out_arrayidx39_i_i843 => ethash_search_B1_merge_out_arrayidx39_i_i843,
        out_arrayidx40_i_i845 => ethash_search_B1_merge_out_arrayidx40_i_i845,
        out_arrayidx42_i_i848 => ethash_search_B1_merge_out_arrayidx42_i_i848,
        out_arrayidx44_i_i851 => ethash_search_B1_merge_out_arrayidx44_i_i851,
        out_arrayidx46_i_i854 => ethash_search_B1_merge_out_arrayidx46_i_i854,
        out_arrayidx4_i_i797 => ethash_search_B1_merge_out_arrayidx4_i_i797,
        out_arrayidx6_i_i799 => ethash_search_B1_merge_out_arrayidx6_i_i799,
        out_fpgaindvars_iv15 => ethash_search_B1_merge_out_fpgaindvars_iv15,
        out_global_id_0197 => ethash_search_B1_merge_out_global_id_0197,
        out_l_grpid_08 => ethash_search_B1_merge_out_l_grpid_08,
        out_l_grpid_0_addr13 => ethash_search_B1_merge_out_l_grpid_0_addr13,
        out_r_0_i_ph => ethash_search_B1_merge_out_r_0_i_ph,
        out_scalarizer_0 => ethash_search_B1_merge_out_scalarizer_0,
        out_scalarizer_01001 => ethash_search_B1_merge_out_scalarizer_01001,
        out_scalarizer_01003 => ethash_search_B1_merge_out_scalarizer_01003,
        out_scalarizer_01005 => ethash_search_B1_merge_out_scalarizer_01005,
        out_scalarizer_01007 => ethash_search_B1_merge_out_scalarizer_01007,
        out_scalarizer_0987 => ethash_search_B1_merge_out_scalarizer_0987,
        out_scalarizer_0989 => ethash_search_B1_merge_out_scalarizer_0989,
        out_scalarizer_0991 => ethash_search_B1_merge_out_scalarizer_0991,
        out_scalarizer_0993 => ethash_search_B1_merge_out_scalarizer_0993,
        out_scalarizer_0995 => ethash_search_B1_merge_out_scalarizer_0995,
        out_scalarizer_0997 => ethash_search_B1_merge_out_scalarizer_0997,
        out_scalarizer_0999 => ethash_search_B1_merge_out_scalarizer_0999,
        out_scalarizer_1 => ethash_search_B1_merge_out_scalarizer_1,
        out_scalarizer_11000 => ethash_search_B1_merge_out_scalarizer_11000,
        out_scalarizer_11002 => ethash_search_B1_merge_out_scalarizer_11002,
        out_scalarizer_11004 => ethash_search_B1_merge_out_scalarizer_11004,
        out_scalarizer_11006 => ethash_search_B1_merge_out_scalarizer_11006,
        out_scalarizer_11008 => ethash_search_B1_merge_out_scalarizer_11008,
        out_scalarizer_1988 => ethash_search_B1_merge_out_scalarizer_1988,
        out_scalarizer_1990 => ethash_search_B1_merge_out_scalarizer_1990,
        out_scalarizer_1992 => ethash_search_B1_merge_out_scalarizer_1992,
        out_scalarizer_1994 => ethash_search_B1_merge_out_scalarizer_1994,
        out_scalarizer_1996 => ethash_search_B1_merge_out_scalarizer_1996,
        out_scalarizer_1998 => ethash_search_B1_merge_out_scalarizer_1998,
        out_stall_out_0 => ethash_search_B1_merge_out_stall_out_0,
        out_stall_out_1 => ethash_search_B1_merge_out_stall_out_1,
        out_valid_out => ethash_search_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- num49_cast_x(BITSELECT,94)
    num49_cast_x_b <= ethash_search_B1_merge_out_scalarizer_1998(31 downto 0);

    -- num48_cast_x(BITSELECT,93)
    num48_cast_x_b <= ethash_search_B1_merge_out_scalarizer_1996(31 downto 0);

    -- num47_cast_x(BITSELECT,92)
    num47_cast_x_b <= ethash_search_B1_merge_out_scalarizer_1994(31 downto 0);

    -- num46_cast_x(BITSELECT,91)
    num46_cast_x_b <= ethash_search_B1_merge_out_scalarizer_1992(31 downto 0);

    -- num45_cast_x(BITSELECT,90)
    num45_cast_x_b <= ethash_search_B1_merge_out_scalarizer_1990(31 downto 0);

    -- num44_cast_x(BITSELECT,89)
    num44_cast_x_b <= ethash_search_B1_merge_out_scalarizer_1988(31 downto 0);

    -- num43_cast_x(BITSELECT,88)
    num43_cast_x_b <= ethash_search_B1_merge_out_scalarizer_11008(31 downto 0);

    -- num42_cast_x(BITSELECT,87)
    num42_cast_x_b <= ethash_search_B1_merge_out_scalarizer_11006(31 downto 0);

    -- num41_cast_x(BITSELECT,86)
    num41_cast_x_b <= ethash_search_B1_merge_out_scalarizer_11004(31 downto 0);

    -- num40_cast_x(BITSELECT,85)
    num40_cast_x_b <= ethash_search_B1_merge_out_scalarizer_11002(31 downto 0);

    -- num39_cast_x(BITSELECT,83)
    num39_cast_x_b <= ethash_search_B1_merge_out_scalarizer_11000(31 downto 0);

    -- num38_cast_x(BITSELECT,82)
    num38_cast_x_b <= ethash_search_B1_merge_out_scalarizer_1(31 downto 0);

    -- num37_cast_x(BITSELECT,81)
    num37_cast_x_b <= ethash_search_B1_merge_out_scalarizer_0999(31 downto 0);

    -- num36_cast_x(BITSELECT,80)
    num36_cast_x_b <= ethash_search_B1_merge_out_scalarizer_0997(31 downto 0);

    -- num35_cast_x(BITSELECT,79)
    num35_cast_x_b <= ethash_search_B1_merge_out_scalarizer_0995(31 downto 0);

    -- num34_cast_x(BITSELECT,78)
    num34_cast_x_b <= ethash_search_B1_merge_out_scalarizer_0993(31 downto 0);

    -- num33_cast_x(BITSELECT,77)
    num33_cast_x_b <= ethash_search_B1_merge_out_scalarizer_0991(31 downto 0);

    -- num32_cast_x(BITSELECT,76)
    num32_cast_x_b <= ethash_search_B1_merge_out_scalarizer_0989(31 downto 0);

    -- num31_cast_x(BITSELECT,75)
    num31_cast_x_b <= ethash_search_B1_merge_out_scalarizer_0987(31 downto 0);

    -- num30_cast_x(BITSELECT,74)
    num30_cast_x_b <= ethash_search_B1_merge_out_scalarizer_01007(31 downto 0);

    -- num29_cast_x(BITSELECT,72)
    num29_cast_x_b <= ethash_search_B1_merge_out_scalarizer_01005(31 downto 0);

    -- num28_cast_x(BITSELECT,71)
    num28_cast_x_b <= ethash_search_B1_merge_out_scalarizer_01003(31 downto 0);

    -- num27_cast_x(BITSELECT,70)
    num27_cast_x_b <= ethash_search_B1_merge_out_scalarizer_01001(31 downto 0);

    -- num26_cast_x(BITSELECT,69)
    num26_cast_x_b <= ethash_search_B1_merge_out_scalarizer_0(31 downto 0);

    -- num25_cast_x(BITSELECT,68)
    num25_cast_x_b <= ethash_search_B1_merge_out_r_0_i_ph(31 downto 0);

    -- num24_cast_x(BITSELECT,67)
    num24_cast_x_b <= ethash_search_B1_merge_out_l_grpid_0_addr13(31 downto 0);

    -- num23_cast_x(BITSELECT,66)
    num23_cast_x_b <= ethash_search_B1_merge_out_l_grpid_08(31 downto 0);

    -- num22_cast_x(BITSELECT,65)
    num22_cast_x_b <= ethash_search_B1_merge_out_global_id_0197(31 downto 0);

    -- num21_cast_x(BITSELECT,64)
    num21_cast_x_b <= ethash_search_B1_merge_out_fpgaindvars_iv15(5 downto 0);

    -- num20_cast_x(BITSELECT,63)
    num20_cast_x_b <= ethash_search_B1_merge_out_arrayidx6_i_i799(63 downto 0);

    -- num19_cast_x(BITSELECT,61)
    num19_cast_x_b <= ethash_search_B1_merge_out_arrayidx4_i_i797(63 downto 0);

    -- num18_cast_x(BITSELECT,60)
    num18_cast_x_b <= ethash_search_B1_merge_out_arrayidx46_i_i854(63 downto 0);

    -- num17_cast_x(BITSELECT,59)
    num17_cast_x_b <= ethash_search_B1_merge_out_arrayidx44_i_i851(63 downto 0);

    -- num16_cast_x(BITSELECT,58)
    num16_cast_x_b <= ethash_search_B1_merge_out_arrayidx42_i_i848(63 downto 0);

    -- num15_cast_x(BITSELECT,57)
    num15_cast_x_b <= ethash_search_B1_merge_out_arrayidx40_i_i845(63 downto 0);

    -- num14_cast_x(BITSELECT,56)
    num14_cast_x_b <= ethash_search_B1_merge_out_arrayidx39_i_i843(63 downto 0);

    -- num13_cast_x(BITSELECT,55)
    num13_cast_x_b <= ethash_search_B1_merge_out_arrayidx36_i_i840(63 downto 0);

    -- num12_cast_x(BITSELECT,54)
    num12_cast_x_b <= ethash_search_B1_merge_out_arrayidx34_i_i837(63 downto 0);

    -- num11_cast_x(BITSELECT,53)
    num11_cast_x_b <= ethash_search_B1_merge_out_arrayidx32_i_i834(63 downto 0);

    -- num10_cast_x(BITSELECT,52)
    num10_cast_x_b <= ethash_search_B1_merge_out_arrayidx30_i_i871(63 downto 0);

    -- num9_cast_x(BITSELECT,100)
    num9_cast_x_b <= ethash_search_B1_merge_out_arrayidx2_i_i795(63 downto 0);

    -- num8_cast_x(BITSELECT,99)
    num8_cast_x_b <= ethash_search_B1_merge_out_arrayidx26_i_i826(63 downto 0);

    -- num7_cast_x(BITSELECT,98)
    num7_cast_x_b <= ethash_search_B1_merge_out_arrayidx24_i_i823(63 downto 0);

    -- num6_cast_x(BITSELECT,97)
    num6_cast_x_b <= ethash_search_B1_merge_out_arrayidx22_i_i820(63 downto 0);

    -- num5_cast_x(BITSELECT,96)
    num5_cast_x_b <= ethash_search_B1_merge_out_arrayidx20_i_i817(63 downto 0);

    -- num4_cast_x(BITSELECT,95)
    num4_cast_x_b <= ethash_search_B1_merge_out_arrayidx1_i_i856(63 downto 0);

    -- num3_cast_x(BITSELECT,84)
    num3_cast_x_b <= ethash_search_B1_merge_out_arrayidx16_i_i812(63 downto 0);

    -- num2_cast_x(BITSELECT,73)
    num2_cast_x_b <= ethash_search_B1_merge_out_arrayidx14_i_i809(63 downto 0);

    -- num1_cast_x(BITSELECT,62)
    num1_cast_x_b <= ethash_search_B1_merge_out_arrayidx12_i_i806(63 downto 0);

    -- num0_cast_x(BITSELECT,51)
    num0_cast_x_b <= ethash_search_B1_merge_out_arrayidx10_i_i803(63 downto 0);

    -- aggregateWireOut_join(BITJOIN,101)
    aggregateWireOut_join_q <= num49_cast_x_b & num48_cast_x_b & num47_cast_x_b & num46_cast_x_b & num45_cast_x_b & num44_cast_x_b & num43_cast_x_b & num42_cast_x_b & num41_cast_x_b & num40_cast_x_b & num39_cast_x_b & num38_cast_x_b & num37_cast_x_b & num36_cast_x_b & num35_cast_x_b & num34_cast_x_b & num33_cast_x_b & num32_cast_x_b & num31_cast_x_b & num30_cast_x_b & num29_cast_x_b & num28_cast_x_b & num27_cast_x_b & num26_cast_x_b & num25_cast_x_b & num24_cast_x_b & num23_cast_x_b & num22_cast_x_b & num21_cast_x_b & num20_cast_x_b & num19_cast_x_b & num18_cast_x_b & num17_cast_x_b & num16_cast_x_b & num15_cast_x_b & num14_cast_x_b & num13_cast_x_b & num12_cast_x_b & num11_cast_x_b & num10_cast_x_b & num9_cast_x_b & num8_cast_x_b & num7_cast_x_b & num6_cast_x_b & num5_cast_x_b & num4_cast_x_b & num3_cast_x_b & num2_cast_x_b & num1_cast_x_b & num0_cast_x_b;

    -- loop_capacity_FIFO(BLACKBOX,215)
    theloop_capacity_FIFO : loop_capacity_FIFO
    PORT MAP (
        in_data_in => aggregateWireOut_join_q,
        in_stall_in => bb_ethash_search_B1_stall_region_out_stall_out,
        in_valid_in => ethash_search_B1_merge_out_valid_out,
        out_data_out => loop_capacity_FIFO_out_data_out,
        out_stall_out => loop_capacity_FIFO_out_stall_out,
        out_valid_out => loop_capacity_FIFO_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_48_data_out_select_x(BITSELECT,50)
    dupName_48_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(2245 downto 2214);

    -- dupName_47_data_out_select_x(BITSELECT,49)
    dupName_47_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(2213 downto 2182);

    -- dupName_46_data_out_select_x(BITSELECT,48)
    dupName_46_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(2181 downto 2150);

    -- dupName_45_data_out_select_x(BITSELECT,47)
    dupName_45_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(2149 downto 2118);

    -- dupName_44_data_out_select_x(BITSELECT,46)
    dupName_44_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(2117 downto 2086);

    -- dupName_43_data_out_select_x(BITSELECT,45)
    dupName_43_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(2085 downto 2054);

    -- dupName_42_data_out_select_x(BITSELECT,44)
    dupName_42_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(2053 downto 2022);

    -- dupName_41_data_out_select_x(BITSELECT,43)
    dupName_41_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(2021 downto 1990);

    -- dupName_40_data_out_select_x(BITSELECT,42)
    dupName_40_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1989 downto 1958);

    -- dupName_39_data_out_select_x(BITSELECT,41)
    dupName_39_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1957 downto 1926);

    -- dupName_38_data_out_select_x(BITSELECT,40)
    dupName_38_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1925 downto 1894);

    -- dupName_37_data_out_select_x(BITSELECT,39)
    dupName_37_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1893 downto 1862);

    -- dupName_36_data_out_select_x(BITSELECT,38)
    dupName_36_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1861 downto 1830);

    -- dupName_35_data_out_select_x(BITSELECT,37)
    dupName_35_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1829 downto 1798);

    -- dupName_34_data_out_select_x(BITSELECT,36)
    dupName_34_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1797 downto 1766);

    -- dupName_33_data_out_select_x(BITSELECT,35)
    dupName_33_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1765 downto 1734);

    -- dupName_32_data_out_select_x(BITSELECT,34)
    dupName_32_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1733 downto 1702);

    -- dupName_31_data_out_select_x(BITSELECT,33)
    dupName_31_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1701 downto 1670);

    -- dupName_30_data_out_select_x(BITSELECT,32)
    dupName_30_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1669 downto 1638);

    -- dupName_29_data_out_select_x(BITSELECT,31)
    dupName_29_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1637 downto 1606);

    -- dupName_28_data_out_select_x(BITSELECT,30)
    dupName_28_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1605 downto 1574);

    -- dupName_27_data_out_select_x(BITSELECT,29)
    dupName_27_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1573 downto 1542);

    -- dupName_26_data_out_select_x(BITSELECT,28)
    dupName_26_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1541 downto 1510);

    -- dupName_25_data_out_select_x(BITSELECT,27)
    dupName_25_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1509 downto 1478);

    -- dupName_24_data_out_select_x(BITSELECT,26)
    dupName_24_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1477 downto 1446);

    -- dupName_23_data_out_select_x(BITSELECT,25)
    dupName_23_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1445 downto 1414);

    -- dupName_22_data_out_select_x(BITSELECT,24)
    dupName_22_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1413 downto 1382);

    -- dupName_21_data_out_select_x(BITSELECT,23)
    dupName_21_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1381 downto 1350);

    -- dupName_20_data_out_select_x(BITSELECT,22)
    dupName_20_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1349 downto 1344);

    -- dupName_19_data_out_select_x(BITSELECT,21)
    dupName_19_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1343 downto 1280);

    -- dupName_18_data_out_select_x(BITSELECT,20)
    dupName_18_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1279 downto 1216);

    -- dupName_17_data_out_select_x(BITSELECT,19)
    dupName_17_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1215 downto 1152);

    -- dupName_16_data_out_select_x(BITSELECT,18)
    dupName_16_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1151 downto 1088);

    -- dupName_15_data_out_select_x(BITSELECT,17)
    dupName_15_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1087 downto 1024);

    -- dupName_14_data_out_select_x(BITSELECT,16)
    dupName_14_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1023 downto 960);

    -- dupName_13_data_out_select_x(BITSELECT,15)
    dupName_13_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(959 downto 896);

    -- dupName_12_data_out_select_x(BITSELECT,14)
    dupName_12_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(895 downto 832);

    -- dupName_11_data_out_select_x(BITSELECT,13)
    dupName_11_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(831 downto 768);

    -- dupName_10_data_out_select_x(BITSELECT,12)
    dupName_10_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(767 downto 704);

    -- dupName_9_data_out_select_x(BITSELECT,11)
    dupName_9_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(703 downto 640);

    -- dupName_8_data_out_select_x(BITSELECT,10)
    dupName_8_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(639 downto 576);

    -- dupName_7_data_out_select_x(BITSELECT,9)
    dupName_7_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(575 downto 512);

    -- dupName_6_data_out_select_x(BITSELECT,8)
    dupName_6_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(511 downto 448);

    -- dupName_5_data_out_select_x(BITSELECT,7)
    dupName_5_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(447 downto 384);

    -- dupName_4_data_out_select_x(BITSELECT,6)
    dupName_4_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(383 downto 320);

    -- dupName_3_data_out_select_x(BITSELECT,5)
    dupName_3_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(319 downto 256);

    -- dupName_2_data_out_select_x(BITSELECT,4)
    dupName_2_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(255 downto 192);

    -- dupName_1_data_out_select_x(BITSELECT,3)
    dupName_1_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(191 downto 128);

    -- dupName_0_data_out_select_x(BITSELECT,2)
    dupName_0_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(127 downto 64);

    -- data_out_select(BITSELECT,103)
    data_out_select_b <= loop_capacity_FIFO_out_data_out(63 downto 0);

    -- bb_ethash_search_B1_stall_region(BLACKBOX,102)
    thebb_ethash_search_B1_stall_region : bb_ethash_search_B1_stall_region
    PORT MAP (
        in_arrayidx10_i_i803 => data_out_select_b,
        in_arrayidx12_i_i806 => dupName_0_data_out_select_x_b,
        in_arrayidx14_i_i809 => dupName_1_data_out_select_x_b,
        in_arrayidx16_i_i812 => dupName_2_data_out_select_x_b,
        in_arrayidx1_i_i856 => dupName_3_data_out_select_x_b,
        in_arrayidx20_i_i817 => dupName_4_data_out_select_x_b,
        in_arrayidx22_i_i820 => dupName_5_data_out_select_x_b,
        in_arrayidx24_i_i823 => dupName_6_data_out_select_x_b,
        in_arrayidx26_i_i826 => dupName_7_data_out_select_x_b,
        in_arrayidx2_i_i795 => dupName_8_data_out_select_x_b,
        in_arrayidx30_i_i871 => dupName_9_data_out_select_x_b,
        in_arrayidx32_i_i834 => dupName_10_data_out_select_x_b,
        in_arrayidx34_i_i837 => dupName_11_data_out_select_x_b,
        in_arrayidx36_i_i840 => dupName_12_data_out_select_x_b,
        in_arrayidx39_i_i843 => dupName_13_data_out_select_x_b,
        in_arrayidx40_i_i845 => dupName_14_data_out_select_x_b,
        in_arrayidx42_i_i848 => dupName_15_data_out_select_x_b,
        in_arrayidx44_i_i851 => dupName_16_data_out_select_x_b,
        in_arrayidx46_i_i854 => dupName_17_data_out_select_x_b,
        in_arrayidx4_i_i797 => dupName_18_data_out_select_x_b,
        in_arrayidx6_i_i799 => dupName_19_data_out_select_x_b,
        in_fpgaindvars_iv15 => dupName_20_data_out_select_x_b,
        in_global_id_0197 => dupName_21_data_out_select_x_b,
        in_isolate => in_isolate,
        in_l_grpid_08 => dupName_22_data_out_select_x_b,
        in_l_grpid_0_addr13 => dupName_23_data_out_select_x_b,
        in_r_0_i_ph => dupName_24_data_out_select_x_b,
        in_scalarizer_0 => dupName_25_data_out_select_x_b,
        in_scalarizer_01001 => dupName_26_data_out_select_x_b,
        in_scalarizer_01003 => dupName_27_data_out_select_x_b,
        in_scalarizer_01005 => dupName_28_data_out_select_x_b,
        in_scalarizer_01007 => dupName_29_data_out_select_x_b,
        in_scalarizer_0987 => dupName_30_data_out_select_x_b,
        in_scalarizer_0989 => dupName_31_data_out_select_x_b,
        in_scalarizer_0991 => dupName_32_data_out_select_x_b,
        in_scalarizer_0993 => dupName_33_data_out_select_x_b,
        in_scalarizer_0995 => dupName_34_data_out_select_x_b,
        in_scalarizer_0997 => dupName_35_data_out_select_x_b,
        in_scalarizer_0999 => dupName_36_data_out_select_x_b,
        in_scalarizer_1 => dupName_37_data_out_select_x_b,
        in_scalarizer_11000 => dupName_38_data_out_select_x_b,
        in_scalarizer_11002 => dupName_39_data_out_select_x_b,
        in_scalarizer_11004 => dupName_40_data_out_select_x_b,
        in_scalarizer_11006 => dupName_41_data_out_select_x_b,
        in_scalarizer_11008 => dupName_42_data_out_select_x_b,
        in_scalarizer_1988 => dupName_43_data_out_select_x_b,
        in_scalarizer_1990 => dupName_44_data_out_select_x_b,
        in_scalarizer_1992 => dupName_45_data_out_select_x_b,
        in_scalarizer_1994 => dupName_46_data_out_select_x_b,
        in_scalarizer_1996 => dupName_47_data_out_select_x_b,
        in_scalarizer_1998 => dupName_48_data_out_select_x_b,
        in_stall_in => ethash_search_B1_branch_out_stall_out,
        in_valid_in => loop_capacity_FIFO_out_valid_out,
        out_c0_exe1 => bb_ethash_search_B1_stall_region_out_c0_exe1,
        out_c0_exe10 => bb_ethash_search_B1_stall_region_out_c0_exe10,
        out_c0_exe11 => bb_ethash_search_B1_stall_region_out_c0_exe11,
        out_c0_exe12 => bb_ethash_search_B1_stall_region_out_c0_exe12,
        out_c0_exe13 => bb_ethash_search_B1_stall_region_out_c0_exe13,
        out_c0_exe14 => bb_ethash_search_B1_stall_region_out_c0_exe14,
        out_c0_exe15 => bb_ethash_search_B1_stall_region_out_c0_exe15,
        out_c0_exe16 => bb_ethash_search_B1_stall_region_out_c0_exe16,
        out_c0_exe17 => bb_ethash_search_B1_stall_region_out_c0_exe17,
        out_c0_exe18 => bb_ethash_search_B1_stall_region_out_c0_exe18,
        out_c0_exe19 => bb_ethash_search_B1_stall_region_out_c0_exe19,
        out_c0_exe2 => bb_ethash_search_B1_stall_region_out_c0_exe2,
        out_c0_exe20 => bb_ethash_search_B1_stall_region_out_c0_exe20,
        out_c0_exe21 => bb_ethash_search_B1_stall_region_out_c0_exe21,
        out_c0_exe22 => bb_ethash_search_B1_stall_region_out_c0_exe22,
        out_c0_exe23 => bb_ethash_search_B1_stall_region_out_c0_exe23,
        out_c0_exe24 => bb_ethash_search_B1_stall_region_out_c0_exe24,
        out_c0_exe25 => bb_ethash_search_B1_stall_region_out_c0_exe25,
        out_c0_exe26 => bb_ethash_search_B1_stall_region_out_c0_exe26,
        out_c0_exe27 => bb_ethash_search_B1_stall_region_out_c0_exe27,
        out_c0_exe28 => bb_ethash_search_B1_stall_region_out_c0_exe28,
        out_c0_exe29 => bb_ethash_search_B1_stall_region_out_c0_exe29,
        out_c0_exe3 => bb_ethash_search_B1_stall_region_out_c0_exe3,
        out_c0_exe30 => bb_ethash_search_B1_stall_region_out_c0_exe30,
        out_c0_exe31 => bb_ethash_search_B1_stall_region_out_c0_exe31,
        out_c0_exe32 => bb_ethash_search_B1_stall_region_out_c0_exe32,
        out_c0_exe33 => bb_ethash_search_B1_stall_region_out_c0_exe33,
        out_c0_exe34 => bb_ethash_search_B1_stall_region_out_c0_exe34,
        out_c0_exe35 => bb_ethash_search_B1_stall_region_out_c0_exe35,
        out_c0_exe36 => bb_ethash_search_B1_stall_region_out_c0_exe36,
        out_c0_exe37 => bb_ethash_search_B1_stall_region_out_c0_exe37,
        out_c0_exe38 => bb_ethash_search_B1_stall_region_out_c0_exe38,
        out_c0_exe39 => bb_ethash_search_B1_stall_region_out_c0_exe39,
        out_c0_exe4 => bb_ethash_search_B1_stall_region_out_c0_exe4,
        out_c0_exe40 => bb_ethash_search_B1_stall_region_out_c0_exe40,
        out_c0_exe41 => bb_ethash_search_B1_stall_region_out_c0_exe41,
        out_c0_exe42 => bb_ethash_search_B1_stall_region_out_c0_exe42,
        out_c0_exe43 => bb_ethash_search_B1_stall_region_out_c0_exe43,
        out_c0_exe44 => bb_ethash_search_B1_stall_region_out_c0_exe44,
        out_c0_exe45 => bb_ethash_search_B1_stall_region_out_c0_exe45,
        out_c0_exe46 => bb_ethash_search_B1_stall_region_out_c0_exe46,
        out_c0_exe47 => bb_ethash_search_B1_stall_region_out_c0_exe47,
        out_c0_exe48 => bb_ethash_search_B1_stall_region_out_c0_exe48,
        out_c0_exe49 => bb_ethash_search_B1_stall_region_out_c0_exe49,
        out_c0_exe5 => bb_ethash_search_B1_stall_region_out_c0_exe5,
        out_c0_exe50 => bb_ethash_search_B1_stall_region_out_c0_exe50,
        out_c0_exe51 => bb_ethash_search_B1_stall_region_out_c0_exe51,
        out_c0_exe52 => bb_ethash_search_B1_stall_region_out_c0_exe52,
        out_c0_exe6 => bb_ethash_search_B1_stall_region_out_c0_exe6,
        out_c0_exe7 => bb_ethash_search_B1_stall_region_out_c0_exe7,
        out_c0_exe8 => bb_ethash_search_B1_stall_region_out_c0_exe8,
        out_c0_exe9 => bb_ethash_search_B1_stall_region_out_c0_exe9,
        out_global_id_0197 => bb_ethash_search_B1_stall_region_out_global_id_0197,
        out_l_grpid_08 => bb_ethash_search_B1_stall_region_out_l_grpid_08,
        out_l_grpid_0_addr13 => bb_ethash_search_B1_stall_region_out_l_grpid_0_addr13,
        out_scalarizer_0 => bb_ethash_search_B1_stall_region_out_scalarizer_0,
        out_scalarizer_01001 => bb_ethash_search_B1_stall_region_out_scalarizer_01001,
        out_scalarizer_01003 => bb_ethash_search_B1_stall_region_out_scalarizer_01003,
        out_scalarizer_01005 => bb_ethash_search_B1_stall_region_out_scalarizer_01005,
        out_scalarizer_01007 => bb_ethash_search_B1_stall_region_out_scalarizer_01007,
        out_scalarizer_0987 => bb_ethash_search_B1_stall_region_out_scalarizer_0987,
        out_scalarizer_0989 => bb_ethash_search_B1_stall_region_out_scalarizer_0989,
        out_scalarizer_0991 => bb_ethash_search_B1_stall_region_out_scalarizer_0991,
        out_scalarizer_0993 => bb_ethash_search_B1_stall_region_out_scalarizer_0993,
        out_scalarizer_0995 => bb_ethash_search_B1_stall_region_out_scalarizer_0995,
        out_scalarizer_0997 => bb_ethash_search_B1_stall_region_out_scalarizer_0997,
        out_scalarizer_0999 => bb_ethash_search_B1_stall_region_out_scalarizer_0999,
        out_scalarizer_1 => bb_ethash_search_B1_stall_region_out_scalarizer_1,
        out_scalarizer_11000 => bb_ethash_search_B1_stall_region_out_scalarizer_11000,
        out_scalarizer_11002 => bb_ethash_search_B1_stall_region_out_scalarizer_11002,
        out_scalarizer_11004 => bb_ethash_search_B1_stall_region_out_scalarizer_11004,
        out_scalarizer_11006 => bb_ethash_search_B1_stall_region_out_scalarizer_11006,
        out_scalarizer_11008 => bb_ethash_search_B1_stall_region_out_scalarizer_11008,
        out_scalarizer_1988 => bb_ethash_search_B1_stall_region_out_scalarizer_1988,
        out_scalarizer_1990 => bb_ethash_search_B1_stall_region_out_scalarizer_1990,
        out_scalarizer_1992 => bb_ethash_search_B1_stall_region_out_scalarizer_1992,
        out_scalarizer_1994 => bb_ethash_search_B1_stall_region_out_scalarizer_1994,
        out_scalarizer_1996 => bb_ethash_search_B1_stall_region_out_scalarizer_1996,
        out_scalarizer_1998 => bb_ethash_search_B1_stall_region_out_scalarizer_1998,
        out_stall_out => bb_ethash_search_B1_stall_region_out_stall_out,
        out_valid_out => bb_ethash_search_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B1_branch(BLACKBOX,104)
    theethash_search_B1_branch : ethash_search_B1_branch
    PORT MAP (
        in_c0_exe1 => bb_ethash_search_B1_stall_region_out_c0_exe1,
        in_c0_exe10 => bb_ethash_search_B1_stall_region_out_c0_exe10,
        in_c0_exe11 => bb_ethash_search_B1_stall_region_out_c0_exe11,
        in_c0_exe12 => bb_ethash_search_B1_stall_region_out_c0_exe12,
        in_c0_exe13 => bb_ethash_search_B1_stall_region_out_c0_exe13,
        in_c0_exe14 => bb_ethash_search_B1_stall_region_out_c0_exe14,
        in_c0_exe15 => bb_ethash_search_B1_stall_region_out_c0_exe15,
        in_c0_exe16 => bb_ethash_search_B1_stall_region_out_c0_exe16,
        in_c0_exe17 => bb_ethash_search_B1_stall_region_out_c0_exe17,
        in_c0_exe18 => bb_ethash_search_B1_stall_region_out_c0_exe18,
        in_c0_exe19 => bb_ethash_search_B1_stall_region_out_c0_exe19,
        in_c0_exe2 => bb_ethash_search_B1_stall_region_out_c0_exe2,
        in_c0_exe20 => bb_ethash_search_B1_stall_region_out_c0_exe20,
        in_c0_exe21 => bb_ethash_search_B1_stall_region_out_c0_exe21,
        in_c0_exe22 => bb_ethash_search_B1_stall_region_out_c0_exe22,
        in_c0_exe23 => bb_ethash_search_B1_stall_region_out_c0_exe23,
        in_c0_exe24 => bb_ethash_search_B1_stall_region_out_c0_exe24,
        in_c0_exe25 => bb_ethash_search_B1_stall_region_out_c0_exe25,
        in_c0_exe26 => bb_ethash_search_B1_stall_region_out_c0_exe26,
        in_c0_exe27 => bb_ethash_search_B1_stall_region_out_c0_exe27,
        in_c0_exe28 => bb_ethash_search_B1_stall_region_out_c0_exe28,
        in_c0_exe29 => bb_ethash_search_B1_stall_region_out_c0_exe29,
        in_c0_exe3 => bb_ethash_search_B1_stall_region_out_c0_exe3,
        in_c0_exe30 => bb_ethash_search_B1_stall_region_out_c0_exe30,
        in_c0_exe31 => bb_ethash_search_B1_stall_region_out_c0_exe31,
        in_c0_exe32 => bb_ethash_search_B1_stall_region_out_c0_exe32,
        in_c0_exe33 => bb_ethash_search_B1_stall_region_out_c0_exe33,
        in_c0_exe34 => bb_ethash_search_B1_stall_region_out_c0_exe34,
        in_c0_exe35 => bb_ethash_search_B1_stall_region_out_c0_exe35,
        in_c0_exe36 => bb_ethash_search_B1_stall_region_out_c0_exe36,
        in_c0_exe37 => bb_ethash_search_B1_stall_region_out_c0_exe37,
        in_c0_exe38 => bb_ethash_search_B1_stall_region_out_c0_exe38,
        in_c0_exe39 => bb_ethash_search_B1_stall_region_out_c0_exe39,
        in_c0_exe4 => bb_ethash_search_B1_stall_region_out_c0_exe4,
        in_c0_exe40 => bb_ethash_search_B1_stall_region_out_c0_exe40,
        in_c0_exe41 => bb_ethash_search_B1_stall_region_out_c0_exe41,
        in_c0_exe42 => bb_ethash_search_B1_stall_region_out_c0_exe42,
        in_c0_exe43 => bb_ethash_search_B1_stall_region_out_c0_exe43,
        in_c0_exe44 => bb_ethash_search_B1_stall_region_out_c0_exe44,
        in_c0_exe45 => bb_ethash_search_B1_stall_region_out_c0_exe45,
        in_c0_exe46 => bb_ethash_search_B1_stall_region_out_c0_exe46,
        in_c0_exe47 => bb_ethash_search_B1_stall_region_out_c0_exe47,
        in_c0_exe48 => bb_ethash_search_B1_stall_region_out_c0_exe48,
        in_c0_exe49 => bb_ethash_search_B1_stall_region_out_c0_exe49,
        in_c0_exe5 => bb_ethash_search_B1_stall_region_out_c0_exe5,
        in_c0_exe50 => bb_ethash_search_B1_stall_region_out_c0_exe50,
        in_c0_exe51 => bb_ethash_search_B1_stall_region_out_c0_exe51,
        in_c0_exe52 => bb_ethash_search_B1_stall_region_out_c0_exe52,
        in_c0_exe6 => bb_ethash_search_B1_stall_region_out_c0_exe6,
        in_c0_exe7 => bb_ethash_search_B1_stall_region_out_c0_exe7,
        in_c0_exe8 => bb_ethash_search_B1_stall_region_out_c0_exe8,
        in_c0_exe9 => bb_ethash_search_B1_stall_region_out_c0_exe9,
        in_global_id_0197 => bb_ethash_search_B1_stall_region_out_global_id_0197,
        in_l_grpid_08 => bb_ethash_search_B1_stall_region_out_l_grpid_08,
        in_l_grpid_0_addr13 => bb_ethash_search_B1_stall_region_out_l_grpid_0_addr13,
        in_scalarizer_0 => bb_ethash_search_B1_stall_region_out_scalarizer_0,
        in_scalarizer_01001 => bb_ethash_search_B1_stall_region_out_scalarizer_01001,
        in_scalarizer_01003 => bb_ethash_search_B1_stall_region_out_scalarizer_01003,
        in_scalarizer_01005 => bb_ethash_search_B1_stall_region_out_scalarizer_01005,
        in_scalarizer_01007 => bb_ethash_search_B1_stall_region_out_scalarizer_01007,
        in_scalarizer_0987 => bb_ethash_search_B1_stall_region_out_scalarizer_0987,
        in_scalarizer_0989 => bb_ethash_search_B1_stall_region_out_scalarizer_0989,
        in_scalarizer_0991 => bb_ethash_search_B1_stall_region_out_scalarizer_0991,
        in_scalarizer_0993 => bb_ethash_search_B1_stall_region_out_scalarizer_0993,
        in_scalarizer_0995 => bb_ethash_search_B1_stall_region_out_scalarizer_0995,
        in_scalarizer_0997 => bb_ethash_search_B1_stall_region_out_scalarizer_0997,
        in_scalarizer_0999 => bb_ethash_search_B1_stall_region_out_scalarizer_0999,
        in_scalarizer_1 => bb_ethash_search_B1_stall_region_out_scalarizer_1,
        in_scalarizer_11000 => bb_ethash_search_B1_stall_region_out_scalarizer_11000,
        in_scalarizer_11002 => bb_ethash_search_B1_stall_region_out_scalarizer_11002,
        in_scalarizer_11004 => bb_ethash_search_B1_stall_region_out_scalarizer_11004,
        in_scalarizer_11006 => bb_ethash_search_B1_stall_region_out_scalarizer_11006,
        in_scalarizer_11008 => bb_ethash_search_B1_stall_region_out_scalarizer_11008,
        in_scalarizer_1988 => bb_ethash_search_B1_stall_region_out_scalarizer_1988,
        in_scalarizer_1990 => bb_ethash_search_B1_stall_region_out_scalarizer_1990,
        in_scalarizer_1992 => bb_ethash_search_B1_stall_region_out_scalarizer_1992,
        in_scalarizer_1994 => bb_ethash_search_B1_stall_region_out_scalarizer_1994,
        in_scalarizer_1996 => bb_ethash_search_B1_stall_region_out_scalarizer_1996,
        in_scalarizer_1998 => bb_ethash_search_B1_stall_region_out_scalarizer_1998,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_ethash_search_B1_stall_region_out_valid_out,
        out_c0_exe1 => ethash_search_B1_branch_out_c0_exe1,
        out_c0_exe10 => ethash_search_B1_branch_out_c0_exe10,
        out_c0_exe11 => ethash_search_B1_branch_out_c0_exe11,
        out_c0_exe12 => ethash_search_B1_branch_out_c0_exe12,
        out_c0_exe13 => ethash_search_B1_branch_out_c0_exe13,
        out_c0_exe14 => ethash_search_B1_branch_out_c0_exe14,
        out_c0_exe15 => ethash_search_B1_branch_out_c0_exe15,
        out_c0_exe16 => ethash_search_B1_branch_out_c0_exe16,
        out_c0_exe17 => ethash_search_B1_branch_out_c0_exe17,
        out_c0_exe18 => ethash_search_B1_branch_out_c0_exe18,
        out_c0_exe19 => ethash_search_B1_branch_out_c0_exe19,
        out_c0_exe2 => ethash_search_B1_branch_out_c0_exe2,
        out_c0_exe20 => ethash_search_B1_branch_out_c0_exe20,
        out_c0_exe21 => ethash_search_B1_branch_out_c0_exe21,
        out_c0_exe22 => ethash_search_B1_branch_out_c0_exe22,
        out_c0_exe23 => ethash_search_B1_branch_out_c0_exe23,
        out_c0_exe24 => ethash_search_B1_branch_out_c0_exe24,
        out_c0_exe25 => ethash_search_B1_branch_out_c0_exe25,
        out_c0_exe26 => ethash_search_B1_branch_out_c0_exe26,
        out_c0_exe27 => ethash_search_B1_branch_out_c0_exe27,
        out_c0_exe28 => ethash_search_B1_branch_out_c0_exe28,
        out_c0_exe29 => ethash_search_B1_branch_out_c0_exe29,
        out_c0_exe3 => ethash_search_B1_branch_out_c0_exe3,
        out_c0_exe30 => ethash_search_B1_branch_out_c0_exe30,
        out_c0_exe31 => ethash_search_B1_branch_out_c0_exe31,
        out_c0_exe32 => ethash_search_B1_branch_out_c0_exe32,
        out_c0_exe33 => ethash_search_B1_branch_out_c0_exe33,
        out_c0_exe34 => ethash_search_B1_branch_out_c0_exe34,
        out_c0_exe35 => ethash_search_B1_branch_out_c0_exe35,
        out_c0_exe36 => ethash_search_B1_branch_out_c0_exe36,
        out_c0_exe37 => ethash_search_B1_branch_out_c0_exe37,
        out_c0_exe38 => ethash_search_B1_branch_out_c0_exe38,
        out_c0_exe39 => ethash_search_B1_branch_out_c0_exe39,
        out_c0_exe4 => ethash_search_B1_branch_out_c0_exe4,
        out_c0_exe40 => ethash_search_B1_branch_out_c0_exe40,
        out_c0_exe41 => ethash_search_B1_branch_out_c0_exe41,
        out_c0_exe42 => ethash_search_B1_branch_out_c0_exe42,
        out_c0_exe43 => ethash_search_B1_branch_out_c0_exe43,
        out_c0_exe44 => ethash_search_B1_branch_out_c0_exe44,
        out_c0_exe45 => ethash_search_B1_branch_out_c0_exe45,
        out_c0_exe46 => ethash_search_B1_branch_out_c0_exe46,
        out_c0_exe47 => ethash_search_B1_branch_out_c0_exe47,
        out_c0_exe48 => ethash_search_B1_branch_out_c0_exe48,
        out_c0_exe49 => ethash_search_B1_branch_out_c0_exe49,
        out_c0_exe5 => ethash_search_B1_branch_out_c0_exe5,
        out_c0_exe50 => ethash_search_B1_branch_out_c0_exe50,
        out_c0_exe51 => ethash_search_B1_branch_out_c0_exe51,
        out_c0_exe6 => ethash_search_B1_branch_out_c0_exe6,
        out_c0_exe7 => ethash_search_B1_branch_out_c0_exe7,
        out_c0_exe8 => ethash_search_B1_branch_out_c0_exe8,
        out_c0_exe9 => ethash_search_B1_branch_out_c0_exe9,
        out_global_id_0197 => ethash_search_B1_branch_out_global_id_0197,
        out_l_grpid_08 => ethash_search_B1_branch_out_l_grpid_08,
        out_l_grpid_0_addr13 => ethash_search_B1_branch_out_l_grpid_0_addr13,
        out_scalarizer_0 => ethash_search_B1_branch_out_scalarizer_0,
        out_scalarizer_01001 => ethash_search_B1_branch_out_scalarizer_01001,
        out_scalarizer_01003 => ethash_search_B1_branch_out_scalarizer_01003,
        out_scalarizer_01005 => ethash_search_B1_branch_out_scalarizer_01005,
        out_scalarizer_01007 => ethash_search_B1_branch_out_scalarizer_01007,
        out_scalarizer_0987 => ethash_search_B1_branch_out_scalarizer_0987,
        out_scalarizer_0989 => ethash_search_B1_branch_out_scalarizer_0989,
        out_scalarizer_0991 => ethash_search_B1_branch_out_scalarizer_0991,
        out_scalarizer_0993 => ethash_search_B1_branch_out_scalarizer_0993,
        out_scalarizer_0995 => ethash_search_B1_branch_out_scalarizer_0995,
        out_scalarizer_0997 => ethash_search_B1_branch_out_scalarizer_0997,
        out_scalarizer_0999 => ethash_search_B1_branch_out_scalarizer_0999,
        out_scalarizer_1 => ethash_search_B1_branch_out_scalarizer_1,
        out_scalarizer_11000 => ethash_search_B1_branch_out_scalarizer_11000,
        out_scalarizer_11002 => ethash_search_B1_branch_out_scalarizer_11002,
        out_scalarizer_11004 => ethash_search_B1_branch_out_scalarizer_11004,
        out_scalarizer_11006 => ethash_search_B1_branch_out_scalarizer_11006,
        out_scalarizer_11008 => ethash_search_B1_branch_out_scalarizer_11008,
        out_scalarizer_1988 => ethash_search_B1_branch_out_scalarizer_1988,
        out_scalarizer_1990 => ethash_search_B1_branch_out_scalarizer_1990,
        out_scalarizer_1992 => ethash_search_B1_branch_out_scalarizer_1992,
        out_scalarizer_1994 => ethash_search_B1_branch_out_scalarizer_1994,
        out_scalarizer_1996 => ethash_search_B1_branch_out_scalarizer_1996,
        out_scalarizer_1998 => ethash_search_B1_branch_out_scalarizer_1998,
        out_stall_out => ethash_search_B1_branch_out_stall_out,
        out_valid_out_0 => ethash_search_B1_branch_out_valid_out_0,
        out_valid_out_1 => ethash_search_B1_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe1(GPOUT,216)
    out_c0_exe1 <= ethash_search_B1_branch_out_c0_exe1;

    -- out_c0_exe10(GPOUT,217)
    out_c0_exe10 <= ethash_search_B1_branch_out_c0_exe10;

    -- out_c0_exe11(GPOUT,218)
    out_c0_exe11 <= ethash_search_B1_branch_out_c0_exe11;

    -- out_c0_exe12(GPOUT,219)
    out_c0_exe12 <= ethash_search_B1_branch_out_c0_exe12;

    -- out_c0_exe13(GPOUT,220)
    out_c0_exe13 <= ethash_search_B1_branch_out_c0_exe13;

    -- out_c0_exe14(GPOUT,221)
    out_c0_exe14 <= ethash_search_B1_branch_out_c0_exe14;

    -- out_c0_exe15(GPOUT,222)
    out_c0_exe15 <= ethash_search_B1_branch_out_c0_exe15;

    -- out_c0_exe16(GPOUT,223)
    out_c0_exe16 <= ethash_search_B1_branch_out_c0_exe16;

    -- out_c0_exe17(GPOUT,224)
    out_c0_exe17 <= ethash_search_B1_branch_out_c0_exe17;

    -- out_c0_exe18(GPOUT,225)
    out_c0_exe18 <= ethash_search_B1_branch_out_c0_exe18;

    -- out_c0_exe19(GPOUT,226)
    out_c0_exe19 <= ethash_search_B1_branch_out_c0_exe19;

    -- out_c0_exe2(GPOUT,227)
    out_c0_exe2 <= ethash_search_B1_branch_out_c0_exe2;

    -- out_c0_exe20(GPOUT,228)
    out_c0_exe20 <= ethash_search_B1_branch_out_c0_exe20;

    -- out_c0_exe21(GPOUT,229)
    out_c0_exe21 <= ethash_search_B1_branch_out_c0_exe21;

    -- out_c0_exe22(GPOUT,230)
    out_c0_exe22 <= ethash_search_B1_branch_out_c0_exe22;

    -- out_c0_exe23(GPOUT,231)
    out_c0_exe23 <= ethash_search_B1_branch_out_c0_exe23;

    -- out_c0_exe24(GPOUT,232)
    out_c0_exe24 <= ethash_search_B1_branch_out_c0_exe24;

    -- out_c0_exe25(GPOUT,233)
    out_c0_exe25 <= ethash_search_B1_branch_out_c0_exe25;

    -- out_c0_exe26(GPOUT,234)
    out_c0_exe26 <= ethash_search_B1_branch_out_c0_exe26;

    -- out_c0_exe27(GPOUT,235)
    out_c0_exe27 <= ethash_search_B1_branch_out_c0_exe27;

    -- out_c0_exe28(GPOUT,236)
    out_c0_exe28 <= ethash_search_B1_branch_out_c0_exe28;

    -- out_c0_exe29(GPOUT,237)
    out_c0_exe29 <= ethash_search_B1_branch_out_c0_exe29;

    -- out_c0_exe3(GPOUT,238)
    out_c0_exe3 <= ethash_search_B1_branch_out_c0_exe3;

    -- out_c0_exe30(GPOUT,239)
    out_c0_exe30 <= ethash_search_B1_branch_out_c0_exe30;

    -- out_c0_exe31(GPOUT,240)
    out_c0_exe31 <= ethash_search_B1_branch_out_c0_exe31;

    -- out_c0_exe32(GPOUT,241)
    out_c0_exe32 <= ethash_search_B1_branch_out_c0_exe32;

    -- out_c0_exe33(GPOUT,242)
    out_c0_exe33 <= ethash_search_B1_branch_out_c0_exe33;

    -- out_c0_exe34(GPOUT,243)
    out_c0_exe34 <= ethash_search_B1_branch_out_c0_exe34;

    -- out_c0_exe35(GPOUT,244)
    out_c0_exe35 <= ethash_search_B1_branch_out_c0_exe35;

    -- out_c0_exe36(GPOUT,245)
    out_c0_exe36 <= ethash_search_B1_branch_out_c0_exe36;

    -- out_c0_exe37(GPOUT,246)
    out_c0_exe37 <= ethash_search_B1_branch_out_c0_exe37;

    -- out_c0_exe38(GPOUT,247)
    out_c0_exe38 <= ethash_search_B1_branch_out_c0_exe38;

    -- out_c0_exe39(GPOUT,248)
    out_c0_exe39 <= ethash_search_B1_branch_out_c0_exe39;

    -- out_c0_exe4(GPOUT,249)
    out_c0_exe4 <= ethash_search_B1_branch_out_c0_exe4;

    -- out_c0_exe40(GPOUT,250)
    out_c0_exe40 <= ethash_search_B1_branch_out_c0_exe40;

    -- out_c0_exe41(GPOUT,251)
    out_c0_exe41 <= ethash_search_B1_branch_out_c0_exe41;

    -- out_c0_exe42(GPOUT,252)
    out_c0_exe42 <= ethash_search_B1_branch_out_c0_exe42;

    -- out_c0_exe43(GPOUT,253)
    out_c0_exe43 <= ethash_search_B1_branch_out_c0_exe43;

    -- out_c0_exe44(GPOUT,254)
    out_c0_exe44 <= ethash_search_B1_branch_out_c0_exe44;

    -- out_c0_exe45(GPOUT,255)
    out_c0_exe45 <= ethash_search_B1_branch_out_c0_exe45;

    -- out_c0_exe46(GPOUT,256)
    out_c0_exe46 <= ethash_search_B1_branch_out_c0_exe46;

    -- out_c0_exe47(GPOUT,257)
    out_c0_exe47 <= ethash_search_B1_branch_out_c0_exe47;

    -- out_c0_exe48(GPOUT,258)
    out_c0_exe48 <= ethash_search_B1_branch_out_c0_exe48;

    -- out_c0_exe49(GPOUT,259)
    out_c0_exe49 <= ethash_search_B1_branch_out_c0_exe49;

    -- out_c0_exe5(GPOUT,260)
    out_c0_exe5 <= ethash_search_B1_branch_out_c0_exe5;

    -- out_c0_exe50(GPOUT,261)
    out_c0_exe50 <= ethash_search_B1_branch_out_c0_exe50;

    -- out_c0_exe51(GPOUT,262)
    out_c0_exe51 <= ethash_search_B1_branch_out_c0_exe51;

    -- out_c0_exe6(GPOUT,263)
    out_c0_exe6 <= ethash_search_B1_branch_out_c0_exe6;

    -- out_c0_exe7(GPOUT,264)
    out_c0_exe7 <= ethash_search_B1_branch_out_c0_exe7;

    -- out_c0_exe8(GPOUT,265)
    out_c0_exe8 <= ethash_search_B1_branch_out_c0_exe8;

    -- out_c0_exe9(GPOUT,266)
    out_c0_exe9 <= ethash_search_B1_branch_out_c0_exe9;

    -- out_global_id_0197(GPOUT,267)
    out_global_id_0197 <= ethash_search_B1_branch_out_global_id_0197;

    -- out_l_grpid_08(GPOUT,268)
    out_l_grpid_08 <= ethash_search_B1_branch_out_l_grpid_08;

    -- out_l_grpid_0_addr13(GPOUT,269)
    out_l_grpid_0_addr13 <= ethash_search_B1_branch_out_l_grpid_0_addr13;

    -- out_scalarizer_0(GPOUT,270)
    out_scalarizer_0 <= ethash_search_B1_branch_out_scalarizer_0;

    -- out_scalarizer_01001(GPOUT,271)
    out_scalarizer_01001 <= ethash_search_B1_branch_out_scalarizer_01001;

    -- out_scalarizer_01003(GPOUT,272)
    out_scalarizer_01003 <= ethash_search_B1_branch_out_scalarizer_01003;

    -- out_scalarizer_01005(GPOUT,273)
    out_scalarizer_01005 <= ethash_search_B1_branch_out_scalarizer_01005;

    -- out_scalarizer_01007(GPOUT,274)
    out_scalarizer_01007 <= ethash_search_B1_branch_out_scalarizer_01007;

    -- out_scalarizer_0987(GPOUT,275)
    out_scalarizer_0987 <= ethash_search_B1_branch_out_scalarizer_0987;

    -- out_scalarizer_0989(GPOUT,276)
    out_scalarizer_0989 <= ethash_search_B1_branch_out_scalarizer_0989;

    -- out_scalarizer_0991(GPOUT,277)
    out_scalarizer_0991 <= ethash_search_B1_branch_out_scalarizer_0991;

    -- out_scalarizer_0993(GPOUT,278)
    out_scalarizer_0993 <= ethash_search_B1_branch_out_scalarizer_0993;

    -- out_scalarizer_0995(GPOUT,279)
    out_scalarizer_0995 <= ethash_search_B1_branch_out_scalarizer_0995;

    -- out_scalarizer_0997(GPOUT,280)
    out_scalarizer_0997 <= ethash_search_B1_branch_out_scalarizer_0997;

    -- out_scalarizer_0999(GPOUT,281)
    out_scalarizer_0999 <= ethash_search_B1_branch_out_scalarizer_0999;

    -- out_scalarizer_1(GPOUT,282)
    out_scalarizer_1 <= ethash_search_B1_branch_out_scalarizer_1;

    -- out_scalarizer_11000(GPOUT,283)
    out_scalarizer_11000 <= ethash_search_B1_branch_out_scalarizer_11000;

    -- out_scalarizer_11002(GPOUT,284)
    out_scalarizer_11002 <= ethash_search_B1_branch_out_scalarizer_11002;

    -- out_scalarizer_11004(GPOUT,285)
    out_scalarizer_11004 <= ethash_search_B1_branch_out_scalarizer_11004;

    -- out_scalarizer_11006(GPOUT,286)
    out_scalarizer_11006 <= ethash_search_B1_branch_out_scalarizer_11006;

    -- out_scalarizer_11008(GPOUT,287)
    out_scalarizer_11008 <= ethash_search_B1_branch_out_scalarizer_11008;

    -- out_scalarizer_1988(GPOUT,288)
    out_scalarizer_1988 <= ethash_search_B1_branch_out_scalarizer_1988;

    -- out_scalarizer_1990(GPOUT,289)
    out_scalarizer_1990 <= ethash_search_B1_branch_out_scalarizer_1990;

    -- out_scalarizer_1992(GPOUT,290)
    out_scalarizer_1992 <= ethash_search_B1_branch_out_scalarizer_1992;

    -- out_scalarizer_1994(GPOUT,291)
    out_scalarizer_1994 <= ethash_search_B1_branch_out_scalarizer_1994;

    -- out_scalarizer_1996(GPOUT,292)
    out_scalarizer_1996 <= ethash_search_B1_branch_out_scalarizer_1996;

    -- out_scalarizer_1998(GPOUT,293)
    out_scalarizer_1998 <= ethash_search_B1_branch_out_scalarizer_1998;

    -- out_stall_out_0(GPOUT,294)
    out_stall_out_0 <= ethash_search_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,295)
    out_stall_out_1 <= ethash_search_B1_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,296)
    out_valid_out_0 <= ethash_search_B1_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,297)
    out_valid_out_1 <= ethash_search_B1_branch_out_valid_out_1;

END normal;
