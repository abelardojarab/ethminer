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

-- VHDL created from ethash_search_B1_branch
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

entity ethash_search_B1_branch is
    port (
        in_c0_exe1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe30 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe31 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe32 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe33 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe34 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe35 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe36 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe37 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe38 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe39 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe40 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe41 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe42 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe43 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe44 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe45 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe46 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe47 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe48 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe49 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe5 : in std_logic_vector(5 downto 0);  -- ufix6
        in_c0_exe50 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe51 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe52 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0197 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_08 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr13 : in std_logic_vector(31 downto 0);  -- ufix32
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
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B1_branch;

architecture normal of ethash_search_B1_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe10_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe12_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe13_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe14_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe15_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe16_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe17_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe18_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe19_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe20_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe21_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe22_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe23_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe24_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe25_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe26_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe27_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe28_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe29_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe2_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe30_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe31_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe32_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe33_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe34_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe35_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe36_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe37_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe38_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe39_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe3_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe40_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe41_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe42_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe43_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe44_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe45_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe46_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe47_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe48_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe49_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe4_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe50_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe51_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe52_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe5_reg_q : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_exe6_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe7_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe8_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe9_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B1_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B1_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_0197_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_08_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr13_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01001_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01003_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01005_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01007_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0987_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0989_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0991_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0993_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0995_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0997_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0999_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11000_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11002_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11004_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11006_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11008_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1988_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1990_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1992_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1994_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1996_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1998_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,142)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe52_cmp(LOGICAL,48)
    c0_exe52_cmp_q <= not (in_c0_exe52);

    -- valid_out_1_and(LOGICAL,255)
    valid_out_1_and_q <= in_valid_in and c0_exe52_cmp_q;

    -- valid_1_reg(REG,253)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,144)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,146)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,141)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,254)
    valid_out_0_and_q <= in_valid_in and in_c0_exe52;

    -- valid_0_reg(REG,252)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,143)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,145)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- ethash_search_B1_branch_enable(LOGICAL,54)
    ethash_search_B1_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe1_reg(REG,12)
    c0_exe1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe1_reg_q <= in_c0_exe1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1(GPOUT,147)
    out_c0_exe1 <= c0_exe1_reg_q;

    -- c0_exe10_reg(REG,2)
    c0_exe10_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe10_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe10_reg_q <= in_c0_exe10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe10(GPOUT,148)
    out_c0_exe10 <= c0_exe10_reg_q;

    -- c0_exe11_reg(REG,3)
    c0_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe11_reg_q <= in_c0_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11(GPOUT,149)
    out_c0_exe11 <= c0_exe11_reg_q;

    -- c0_exe12_reg(REG,4)
    c0_exe12_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe12_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe12_reg_q <= in_c0_exe12;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe12(GPOUT,150)
    out_c0_exe12 <= c0_exe12_reg_q;

    -- c0_exe13_reg(REG,5)
    c0_exe13_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe13_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe13_reg_q <= in_c0_exe13;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe13(GPOUT,151)
    out_c0_exe13 <= c0_exe13_reg_q;

    -- c0_exe14_reg(REG,6)
    c0_exe14_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe14_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe14_reg_q <= in_c0_exe14;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe14(GPOUT,152)
    out_c0_exe14 <= c0_exe14_reg_q;

    -- c0_exe15_reg(REG,7)
    c0_exe15_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe15_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe15_reg_q <= in_c0_exe15;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe15(GPOUT,153)
    out_c0_exe15 <= c0_exe15_reg_q;

    -- c0_exe16_reg(REG,8)
    c0_exe16_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe16_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe16_reg_q <= in_c0_exe16;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe16(GPOUT,154)
    out_c0_exe16 <= c0_exe16_reg_q;

    -- c0_exe17_reg(REG,9)
    c0_exe17_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe17_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe17_reg_q <= in_c0_exe17;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe17(GPOUT,155)
    out_c0_exe17 <= c0_exe17_reg_q;

    -- c0_exe18_reg(REG,10)
    c0_exe18_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe18_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe18_reg_q <= in_c0_exe18;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe18(GPOUT,156)
    out_c0_exe18 <= c0_exe18_reg_q;

    -- c0_exe19_reg(REG,11)
    c0_exe19_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe19_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe19_reg_q <= in_c0_exe19;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe19(GPOUT,157)
    out_c0_exe19 <= c0_exe19_reg_q;

    -- c0_exe2_reg(REG,23)
    c0_exe2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe2_reg_q <= in_c0_exe2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2(GPOUT,158)
    out_c0_exe2 <= c0_exe2_reg_q;

    -- c0_exe20_reg(REG,13)
    c0_exe20_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe20_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe20_reg_q <= in_c0_exe20;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe20(GPOUT,159)
    out_c0_exe20 <= c0_exe20_reg_q;

    -- c0_exe21_reg(REG,14)
    c0_exe21_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe21_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe21_reg_q <= in_c0_exe21;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe21(GPOUT,160)
    out_c0_exe21 <= c0_exe21_reg_q;

    -- c0_exe22_reg(REG,15)
    c0_exe22_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe22_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe22_reg_q <= in_c0_exe22;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe22(GPOUT,161)
    out_c0_exe22 <= c0_exe22_reg_q;

    -- c0_exe23_reg(REG,16)
    c0_exe23_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe23_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe23_reg_q <= in_c0_exe23;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe23(GPOUT,162)
    out_c0_exe23 <= c0_exe23_reg_q;

    -- c0_exe24_reg(REG,17)
    c0_exe24_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe24_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe24_reg_q <= in_c0_exe24;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe24(GPOUT,163)
    out_c0_exe24 <= c0_exe24_reg_q;

    -- c0_exe25_reg(REG,18)
    c0_exe25_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe25_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe25_reg_q <= in_c0_exe25;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe25(GPOUT,164)
    out_c0_exe25 <= c0_exe25_reg_q;

    -- c0_exe26_reg(REG,19)
    c0_exe26_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe26_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe26_reg_q <= in_c0_exe26;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe26(GPOUT,165)
    out_c0_exe26 <= c0_exe26_reg_q;

    -- c0_exe27_reg(REG,20)
    c0_exe27_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe27_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe27_reg_q <= in_c0_exe27;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe27(GPOUT,166)
    out_c0_exe27 <= c0_exe27_reg_q;

    -- c0_exe28_reg(REG,21)
    c0_exe28_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe28_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe28_reg_q <= in_c0_exe28;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe28(GPOUT,167)
    out_c0_exe28 <= c0_exe28_reg_q;

    -- c0_exe29_reg(REG,22)
    c0_exe29_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe29_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe29_reg_q <= in_c0_exe29;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe29(GPOUT,168)
    out_c0_exe29 <= c0_exe29_reg_q;

    -- c0_exe3_reg(REG,34)
    c0_exe3_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe3_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe3_reg_q <= in_c0_exe3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe3(GPOUT,169)
    out_c0_exe3 <= c0_exe3_reg_q;

    -- c0_exe30_reg(REG,24)
    c0_exe30_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe30_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe30_reg_q <= in_c0_exe30;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe30(GPOUT,170)
    out_c0_exe30 <= c0_exe30_reg_q;

    -- c0_exe31_reg(REG,25)
    c0_exe31_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe31_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe31_reg_q <= in_c0_exe31;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe31(GPOUT,171)
    out_c0_exe31 <= c0_exe31_reg_q;

    -- c0_exe32_reg(REG,26)
    c0_exe32_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe32_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe32_reg_q <= in_c0_exe32;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe32(GPOUT,172)
    out_c0_exe32 <= c0_exe32_reg_q;

    -- c0_exe33_reg(REG,27)
    c0_exe33_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe33_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe33_reg_q <= in_c0_exe33;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe33(GPOUT,173)
    out_c0_exe33 <= c0_exe33_reg_q;

    -- c0_exe34_reg(REG,28)
    c0_exe34_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe34_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe34_reg_q <= in_c0_exe34;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe34(GPOUT,174)
    out_c0_exe34 <= c0_exe34_reg_q;

    -- c0_exe35_reg(REG,29)
    c0_exe35_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe35_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe35_reg_q <= in_c0_exe35;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe35(GPOUT,175)
    out_c0_exe35 <= c0_exe35_reg_q;

    -- c0_exe36_reg(REG,30)
    c0_exe36_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe36_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe36_reg_q <= in_c0_exe36;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe36(GPOUT,176)
    out_c0_exe36 <= c0_exe36_reg_q;

    -- c0_exe37_reg(REG,31)
    c0_exe37_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe37_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe37_reg_q <= in_c0_exe37;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe37(GPOUT,177)
    out_c0_exe37 <= c0_exe37_reg_q;

    -- c0_exe38_reg(REG,32)
    c0_exe38_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe38_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe38_reg_q <= in_c0_exe38;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe38(GPOUT,178)
    out_c0_exe38 <= c0_exe38_reg_q;

    -- c0_exe39_reg(REG,33)
    c0_exe39_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe39_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe39_reg_q <= in_c0_exe39;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe39(GPOUT,179)
    out_c0_exe39 <= c0_exe39_reg_q;

    -- c0_exe4_reg(REG,45)
    c0_exe4_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe4_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe4_reg_q <= in_c0_exe4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe4(GPOUT,180)
    out_c0_exe4 <= c0_exe4_reg_q;

    -- c0_exe40_reg(REG,35)
    c0_exe40_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe40_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe40_reg_q <= in_c0_exe40;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe40(GPOUT,181)
    out_c0_exe40 <= c0_exe40_reg_q;

    -- c0_exe41_reg(REG,36)
    c0_exe41_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe41_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe41_reg_q <= in_c0_exe41;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe41(GPOUT,182)
    out_c0_exe41 <= c0_exe41_reg_q;

    -- c0_exe42_reg(REG,37)
    c0_exe42_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe42_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe42_reg_q <= in_c0_exe42;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe42(GPOUT,183)
    out_c0_exe42 <= c0_exe42_reg_q;

    -- c0_exe43_reg(REG,38)
    c0_exe43_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe43_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe43_reg_q <= in_c0_exe43;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe43(GPOUT,184)
    out_c0_exe43 <= c0_exe43_reg_q;

    -- c0_exe44_reg(REG,39)
    c0_exe44_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe44_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe44_reg_q <= in_c0_exe44;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe44(GPOUT,185)
    out_c0_exe44 <= c0_exe44_reg_q;

    -- c0_exe45_reg(REG,40)
    c0_exe45_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe45_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe45_reg_q <= in_c0_exe45;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe45(GPOUT,186)
    out_c0_exe45 <= c0_exe45_reg_q;

    -- c0_exe46_reg(REG,41)
    c0_exe46_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe46_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe46_reg_q <= in_c0_exe46;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe46(GPOUT,187)
    out_c0_exe46 <= c0_exe46_reg_q;

    -- c0_exe47_reg(REG,42)
    c0_exe47_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe47_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe47_reg_q <= in_c0_exe47;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe47(GPOUT,188)
    out_c0_exe47 <= c0_exe47_reg_q;

    -- c0_exe48_reg(REG,43)
    c0_exe48_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe48_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe48_reg_q <= in_c0_exe48;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe48(GPOUT,189)
    out_c0_exe48 <= c0_exe48_reg_q;

    -- c0_exe49_reg(REG,44)
    c0_exe49_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe49_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe49_reg_q <= in_c0_exe49;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe49(GPOUT,190)
    out_c0_exe49 <= c0_exe49_reg_q;

    -- c0_exe5_reg(REG,49)
    c0_exe5_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe5_reg_q <= "000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe5_reg_q <= in_c0_exe5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe5(GPOUT,191)
    out_c0_exe5 <= c0_exe5_reg_q;

    -- c0_exe50_reg(REG,46)
    c0_exe50_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe50_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe50_reg_q <= in_c0_exe50;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe50(GPOUT,192)
    out_c0_exe50 <= c0_exe50_reg_q;

    -- c0_exe51_reg(REG,47)
    c0_exe51_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe51_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe51_reg_q <= in_c0_exe51;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe51(GPOUT,193)
    out_c0_exe51 <= c0_exe51_reg_q;

    -- c0_exe6_reg(REG,50)
    c0_exe6_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe6_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe6_reg_q <= in_c0_exe6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe6(GPOUT,194)
    out_c0_exe6 <= c0_exe6_reg_q;

    -- c0_exe7_reg(REG,51)
    c0_exe7_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe7_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe7_reg_q <= in_c0_exe7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe7(GPOUT,195)
    out_c0_exe7 <= c0_exe7_reg_q;

    -- c0_exe8_reg(REG,52)
    c0_exe8_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe8_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe8_reg_q <= in_c0_exe8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe8(GPOUT,196)
    out_c0_exe8 <= c0_exe8_reg_q;

    -- c0_exe9_reg(REG,53)
    c0_exe9_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe9_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                c0_exe9_reg_q <= in_c0_exe9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe9(GPOUT,197)
    out_c0_exe9 <= c0_exe9_reg_q;

    -- global_id_0197_reg(REG,56)
    global_id_0197_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            global_id_0197_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                global_id_0197_reg_q <= in_global_id_0197;
            END IF;
        END IF;
    END PROCESS;

    -- out_global_id_0197(GPOUT,198)
    out_global_id_0197 <= global_id_0197_reg_q;

    -- l_grpid_08_reg(REG,139)
    l_grpid_08_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_08_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                l_grpid_08_reg_q <= in_l_grpid_08;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_08(GPOUT,199)
    out_l_grpid_08 <= l_grpid_08_reg_q;

    -- l_grpid_0_addr13_reg(REG,140)
    l_grpid_0_addr13_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_0_addr13_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                l_grpid_0_addr13_reg_q <= in_l_grpid_0_addr13;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_0_addr13(GPOUT,200)
    out_l_grpid_0_addr13 <= l_grpid_0_addr13_reg_q;

    -- scalarizer_0_reg(REG,239)
    scalarizer_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_0_reg_q <= in_scalarizer_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0(GPOUT,201)
    out_scalarizer_0 <= scalarizer_0_reg_q;

    -- scalarizer_01001_reg(REG,228)
    scalarizer_01001_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01001_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_01001_reg_q <= in_scalarizer_01001;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01001(GPOUT,202)
    out_scalarizer_01001 <= scalarizer_01001_reg_q;

    -- scalarizer_01003_reg(REG,229)
    scalarizer_01003_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01003_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_01003_reg_q <= in_scalarizer_01003;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01003(GPOUT,203)
    out_scalarizer_01003 <= scalarizer_01003_reg_q;

    -- scalarizer_01005_reg(REG,230)
    scalarizer_01005_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01005_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_01005_reg_q <= in_scalarizer_01005;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01005(GPOUT,204)
    out_scalarizer_01005 <= scalarizer_01005_reg_q;

    -- scalarizer_01007_reg(REG,231)
    scalarizer_01007_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01007_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_01007_reg_q <= in_scalarizer_01007;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01007(GPOUT,205)
    out_scalarizer_01007 <= scalarizer_01007_reg_q;

    -- scalarizer_0987_reg(REG,232)
    scalarizer_0987_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0987_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_0987_reg_q <= in_scalarizer_0987;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0987(GPOUT,206)
    out_scalarizer_0987 <= scalarizer_0987_reg_q;

    -- scalarizer_0989_reg(REG,233)
    scalarizer_0989_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0989_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_0989_reg_q <= in_scalarizer_0989;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0989(GPOUT,207)
    out_scalarizer_0989 <= scalarizer_0989_reg_q;

    -- scalarizer_0991_reg(REG,234)
    scalarizer_0991_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0991_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_0991_reg_q <= in_scalarizer_0991;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0991(GPOUT,208)
    out_scalarizer_0991 <= scalarizer_0991_reg_q;

    -- scalarizer_0993_reg(REG,235)
    scalarizer_0993_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0993_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_0993_reg_q <= in_scalarizer_0993;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0993(GPOUT,209)
    out_scalarizer_0993 <= scalarizer_0993_reg_q;

    -- scalarizer_0995_reg(REG,236)
    scalarizer_0995_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0995_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_0995_reg_q <= in_scalarizer_0995;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0995(GPOUT,210)
    out_scalarizer_0995 <= scalarizer_0995_reg_q;

    -- scalarizer_0997_reg(REG,237)
    scalarizer_0997_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0997_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_0997_reg_q <= in_scalarizer_0997;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0997(GPOUT,211)
    out_scalarizer_0997 <= scalarizer_0997_reg_q;

    -- scalarizer_0999_reg(REG,238)
    scalarizer_0999_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0999_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_0999_reg_q <= in_scalarizer_0999;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0999(GPOUT,212)
    out_scalarizer_0999 <= scalarizer_0999_reg_q;

    -- scalarizer_1_reg(REG,251)
    scalarizer_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_1_reg_q <= in_scalarizer_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1(GPOUT,213)
    out_scalarizer_1 <= scalarizer_1_reg_q;

    -- scalarizer_11000_reg(REG,240)
    scalarizer_11000_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11000_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_11000_reg_q <= in_scalarizer_11000;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11000(GPOUT,214)
    out_scalarizer_11000 <= scalarizer_11000_reg_q;

    -- scalarizer_11002_reg(REG,241)
    scalarizer_11002_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11002_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_11002_reg_q <= in_scalarizer_11002;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11002(GPOUT,215)
    out_scalarizer_11002 <= scalarizer_11002_reg_q;

    -- scalarizer_11004_reg(REG,242)
    scalarizer_11004_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11004_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_11004_reg_q <= in_scalarizer_11004;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11004(GPOUT,216)
    out_scalarizer_11004 <= scalarizer_11004_reg_q;

    -- scalarizer_11006_reg(REG,243)
    scalarizer_11006_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11006_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_11006_reg_q <= in_scalarizer_11006;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11006(GPOUT,217)
    out_scalarizer_11006 <= scalarizer_11006_reg_q;

    -- scalarizer_11008_reg(REG,244)
    scalarizer_11008_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11008_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_11008_reg_q <= in_scalarizer_11008;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11008(GPOUT,218)
    out_scalarizer_11008 <= scalarizer_11008_reg_q;

    -- scalarizer_1988_reg(REG,245)
    scalarizer_1988_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1988_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_1988_reg_q <= in_scalarizer_1988;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1988(GPOUT,219)
    out_scalarizer_1988 <= scalarizer_1988_reg_q;

    -- scalarizer_1990_reg(REG,246)
    scalarizer_1990_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1990_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_1990_reg_q <= in_scalarizer_1990;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1990(GPOUT,220)
    out_scalarizer_1990 <= scalarizer_1990_reg_q;

    -- scalarizer_1992_reg(REG,247)
    scalarizer_1992_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1992_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_1992_reg_q <= in_scalarizer_1992;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1992(GPOUT,221)
    out_scalarizer_1992 <= scalarizer_1992_reg_q;

    -- scalarizer_1994_reg(REG,248)
    scalarizer_1994_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1994_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_1994_reg_q <= in_scalarizer_1994;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1994(GPOUT,222)
    out_scalarizer_1994 <= scalarizer_1994_reg_q;

    -- scalarizer_1996_reg(REG,249)
    scalarizer_1996_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1996_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_1996_reg_q <= in_scalarizer_1996;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1996(GPOUT,223)
    out_scalarizer_1996 <= scalarizer_1996_reg_q;

    -- scalarizer_1998_reg(REG,250)
    scalarizer_1998_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1998_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B1_branch_enable_q = "1") THEN
                scalarizer_1998_reg_q <= in_scalarizer_1998;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1998(GPOUT,224)
    out_scalarizer_1998 <= scalarizer_1998_reg_q;

    -- ethash_search_B1_branch_enable_not(LOGICAL,55)
    ethash_search_B1_branch_enable_not_q <= not (ethash_search_B1_branch_enable_q);

    -- out_stall_out(GPOUT,225)
    out_stall_out <= ethash_search_B1_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,226)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,227)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
