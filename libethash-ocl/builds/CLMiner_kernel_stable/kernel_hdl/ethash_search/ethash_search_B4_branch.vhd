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

-- VHDL created from ethash_search_B4_branch
-- VHDL created on Mon Apr  1 13:53:04 2019


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

entity ethash_search_B4_branch is
    port (
        in_xor_i679_3_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_xor_i679_3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_xor_i679_3_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_xor_i679_3_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_a_1907_LC_OuterPHI : in std_logic_vector(31 downto 0);  -- ufix32
        in_and_RM155 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arraydecay51_RM166 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_2_RM165 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx45_RM163 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe1105 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2110 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3114 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4118 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp23157 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23_xor159 : in std_logic_vector(0 downto 0);  -- ufix1
        in_for_end91_LC_COND : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv12136 : in std_logic_vector(3 downto 0);  -- ufix4
        in_fpgaindvars_iv6_LC_InnerPHI : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv9_LC_OuterPHI : in std_logic_vector(4 downto 0);  -- ufix5
        in_global_id_0194 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908154 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i66_2906_LC_InnerPHI : in std_logic_vector(31 downto 0);  -- ufix32
        in_idxprom80_RM : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_05 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext161 : in std_logic_vector(63 downto 0);  -- ufix64
        in_scalarizer_0100164 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100374 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100584 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100794 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173138 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175142 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177146 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179150 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099324 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099534 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099744 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099954 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0xor1200 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100059 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100269 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100479 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100689 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100899 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174140 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176144 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178148 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180152 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199429 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199639 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199849 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1xor1201 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2xor : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3xor : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_0_0_cast122 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast125 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast128 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast131 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast134 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_xor_i679_3_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_a_1907_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_and_RM155 : out std_logic_vector(31 downto 0);  -- ufix32
        out_arraydecay51_RM166 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx36_2_RM165 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx45_RM163 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1105 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2110 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3114 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4118 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp23157 : out std_logic_vector(0 downto 0);  -- ufix1
        out_cmp23_xor159 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv12136 : out std_logic_vector(3 downto 0);  -- ufix4
        out_fpgaindvars_iv6_LC_InnerPHI : out std_logic_vector(2 downto 0);  -- ufix3
        out_fpgaindvars_iv9_LC_OuterPHI : out std_logic_vector(4 downto 0);  -- ufix5
        out_global_id_0194 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i18_0908154 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i66_2906_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_idxprom80_RM : out std_logic_vector(63 downto 0);  -- ufix64
        out_l_grpid_05 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext161 : out std_logic_vector(63 downto 0);  -- ufix64
        out_scalarizer_0100164 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100374 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100584 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100794 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01173138 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01175142 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01177146 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01179150 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099324 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099534 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099744 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099954 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0xor1200 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100059 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100269 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100479 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100689 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100899 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11174140 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11176144 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11178148 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11180152 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199429 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199639 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199849 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1xor1201 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_2xor : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_3xor : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast122 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast125 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast128 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast131 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast134 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B4_branch;

architecture normal of ethash_search_B4_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_i679_3_reg_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_i679_3_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_i679_3_reg_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_i679_3_reg_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal a_1907_LC_OuterPHI_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal and_RM155_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal arraydecay51_RM166_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx36_2_RM165_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx45_RM163_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe1105_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2110_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe3114_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe4118_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cmp23157_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp23_xor159_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal for_end91_LC_COND_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv12136_reg_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fpgaindvars_iv6_LC_InnerPHI_reg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fpgaindvars_iv9_LC_OuterPHI_reg_q : STD_LOGIC_VECTOR (4 downto 0);
    signal global_id_0194_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i18_0908154_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i66_2906_LC_InnerPHI_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal idxprom80_RM_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal l_grpid_05_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr11_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr_zext161_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100164_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100374_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100584_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100794_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01173138_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01175142_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01177146_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01179150_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099324_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099534_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099744_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099954_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0xor1200_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100059_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100269_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100479_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100689_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100899_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11174140_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11176144_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11178148_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11180152_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199429_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199639_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199849_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1xor1201_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_2xor_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_3xor_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal state_0_0_cast122_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_4_0_cast125_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_5_0_cast128_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_6_0_cast131_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_7_0_cast134_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal unnamed_ethash_search32_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,156)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- for_end91_LC_COND_cmp(LOGICAL,144)
    for_end91_LC_COND_cmp_q <= not (in_for_end91_LC_COND);

    -- valid_out_1_and(LOGICAL,198)
    valid_out_1_and_q <= in_valid_in and for_end91_LC_COND_cmp_q;

    -- valid_1_reg(REG,196)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,158)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,160)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,155)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,197)
    valid_out_0_and_q <= in_valid_in and in_for_end91_LC_COND;

    -- valid_0_reg(REG,195)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,157)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,159)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- ethash_search_B4_branch_enable(LOGICAL,142)
    ethash_search_B4_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- xor_i679_3_reg_0_x(REG,127)
    xor_i679_3_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            xor_i679_3_reg_0_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                xor_i679_3_reg_0_x_q <= in_xor_i679_3_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_xor_i679_3_0(GPOUT,65)
    out_xor_i679_3_0 <= xor_i679_3_reg_0_x_q;

    -- xor_i679_3_reg_1_x(REG,128)
    xor_i679_3_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            xor_i679_3_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                xor_i679_3_reg_1_x_q <= in_xor_i679_3_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_xor_i679_3_1(GPOUT,66)
    out_xor_i679_3_1 <= xor_i679_3_reg_1_x_q;

    -- xor_i679_3_reg_2_x(REG,129)
    xor_i679_3_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            xor_i679_3_reg_2_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                xor_i679_3_reg_2_x_q <= in_xor_i679_3_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_xor_i679_3_2(GPOUT,67)
    out_xor_i679_3_2 <= xor_i679_3_reg_2_x_q;

    -- xor_i679_3_reg_3_x(REG,130)
    xor_i679_3_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            xor_i679_3_reg_3_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                xor_i679_3_reg_3_x_q <= in_xor_i679_3_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_xor_i679_3_3(GPOUT,68)
    out_xor_i679_3_3 <= xor_i679_3_reg_3_x_q;

    -- a_1907_LC_OuterPHI_reg(REG,131)
    a_1907_LC_OuterPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            a_1907_LC_OuterPHI_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                a_1907_LC_OuterPHI_reg_q <= in_a_1907_LC_OuterPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_a_1907_LC_OuterPHI(GPOUT,69)
    out_a_1907_LC_OuterPHI <= a_1907_LC_OuterPHI_reg_q;

    -- and_RM155_reg(REG,132)
    and_RM155_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            and_RM155_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                and_RM155_reg_q <= in_and_RM155;
            END IF;
        END IF;
    END PROCESS;

    -- out_and_RM155(GPOUT,70)
    out_and_RM155 <= and_RM155_reg_q;

    -- arraydecay51_RM166_reg(REG,133)
    arraydecay51_RM166_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            arraydecay51_RM166_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                arraydecay51_RM166_reg_q <= in_arraydecay51_RM166;
            END IF;
        END IF;
    END PROCESS;

    -- out_arraydecay51_RM166(GPOUT,71)
    out_arraydecay51_RM166 <= arraydecay51_RM166_reg_q;

    -- arrayidx36_2_RM165_reg(REG,134)
    arrayidx36_2_RM165_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            arrayidx36_2_RM165_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                arrayidx36_2_RM165_reg_q <= in_arrayidx36_2_RM165;
            END IF;
        END IF;
    END PROCESS;

    -- out_arrayidx36_2_RM165(GPOUT,72)
    out_arrayidx36_2_RM165 <= arrayidx36_2_RM165_reg_q;

    -- arrayidx45_RM163_reg(REG,135)
    arrayidx45_RM163_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            arrayidx45_RM163_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                arrayidx45_RM163_reg_q <= in_arrayidx45_RM163;
            END IF;
        END IF;
    END PROCESS;

    -- out_arrayidx45_RM163(GPOUT,73)
    out_arrayidx45_RM163 <= arrayidx45_RM163_reg_q;

    -- c0_exe1105_reg(REG,136)
    c0_exe1105_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1105_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                c0_exe1105_reg_q <= in_c0_exe1105;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1105(GPOUT,74)
    out_c0_exe1105 <= c0_exe1105_reg_q;

    -- c0_exe2110_reg(REG,137)
    c0_exe2110_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2110_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                c0_exe2110_reg_q <= in_c0_exe2110;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2110(GPOUT,75)
    out_c0_exe2110 <= c0_exe2110_reg_q;

    -- c0_exe3114_reg(REG,138)
    c0_exe3114_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe3114_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                c0_exe3114_reg_q <= in_c0_exe3114;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe3114(GPOUT,76)
    out_c0_exe3114 <= c0_exe3114_reg_q;

    -- c0_exe4118_reg(REG,139)
    c0_exe4118_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe4118_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                c0_exe4118_reg_q <= in_c0_exe4118;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe4118(GPOUT,77)
    out_c0_exe4118 <= c0_exe4118_reg_q;

    -- cmp23157_reg(REG,140)
    cmp23157_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            cmp23157_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                cmp23157_reg_q <= in_cmp23157;
            END IF;
        END IF;
    END PROCESS;

    -- out_cmp23157(GPOUT,78)
    out_cmp23157 <= cmp23157_reg_q;

    -- cmp23_xor159_reg(REG,141)
    cmp23_xor159_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            cmp23_xor159_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                cmp23_xor159_reg_q <= in_cmp23_xor159;
            END IF;
        END IF;
    END PROCESS;

    -- out_cmp23_xor159(GPOUT,79)
    out_cmp23_xor159 <= cmp23_xor159_reg_q;

    -- fpgaindvars_iv12136_reg(REG,145)
    fpgaindvars_iv12136_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv12136_reg_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                fpgaindvars_iv12136_reg_q <= in_fpgaindvars_iv12136;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv12136(GPOUT,80)
    out_fpgaindvars_iv12136 <= fpgaindvars_iv12136_reg_q;

    -- fpgaindvars_iv6_LC_InnerPHI_reg(REG,146)
    fpgaindvars_iv6_LC_InnerPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv6_LC_InnerPHI_reg_q <= "000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                fpgaindvars_iv6_LC_InnerPHI_reg_q <= in_fpgaindvars_iv6_LC_InnerPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv6_LC_InnerPHI(GPOUT,81)
    out_fpgaindvars_iv6_LC_InnerPHI <= fpgaindvars_iv6_LC_InnerPHI_reg_q;

    -- fpgaindvars_iv9_LC_OuterPHI_reg(REG,147)
    fpgaindvars_iv9_LC_OuterPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv9_LC_OuterPHI_reg_q <= "00000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                fpgaindvars_iv9_LC_OuterPHI_reg_q <= in_fpgaindvars_iv9_LC_OuterPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv9_LC_OuterPHI(GPOUT,82)
    out_fpgaindvars_iv9_LC_OuterPHI <= fpgaindvars_iv9_LC_OuterPHI_reg_q;

    -- global_id_0194_reg(REG,148)
    global_id_0194_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            global_id_0194_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                global_id_0194_reg_q <= in_global_id_0194;
            END IF;
        END IF;
    END PROCESS;

    -- out_global_id_0194(GPOUT,83)
    out_global_id_0194 <= global_id_0194_reg_q;

    -- i18_0908154_reg(REG,149)
    i18_0908154_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i18_0908154_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                i18_0908154_reg_q <= in_i18_0908154;
            END IF;
        END IF;
    END PROCESS;

    -- out_i18_0908154(GPOUT,84)
    out_i18_0908154 <= i18_0908154_reg_q;

    -- i66_2906_LC_InnerPHI_reg(REG,150)
    i66_2906_LC_InnerPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i66_2906_LC_InnerPHI_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                i66_2906_LC_InnerPHI_reg_q <= in_i66_2906_LC_InnerPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_i66_2906_LC_InnerPHI(GPOUT,85)
    out_i66_2906_LC_InnerPHI <= i66_2906_LC_InnerPHI_reg_q;

    -- idxprom80_RM_reg(REG,151)
    idxprom80_RM_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            idxprom80_RM_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                idxprom80_RM_reg_q <= in_idxprom80_RM;
            END IF;
        END IF;
    END PROCESS;

    -- out_idxprom80_RM(GPOUT,86)
    out_idxprom80_RM <= idxprom80_RM_reg_q;

    -- l_grpid_05_reg(REG,152)
    l_grpid_05_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_05_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                l_grpid_05_reg_q <= in_l_grpid_05;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_05(GPOUT,87)
    out_l_grpid_05 <= l_grpid_05_reg_q;

    -- l_grpid_0_addr11_reg(REG,153)
    l_grpid_0_addr11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_0_addr11_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                l_grpid_0_addr11_reg_q <= in_l_grpid_0_addr11;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_0_addr11(GPOUT,88)
    out_l_grpid_0_addr11 <= l_grpid_0_addr11_reg_q;

    -- l_grpid_0_addr_zext161_reg(REG,154)
    l_grpid_0_addr_zext161_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_0_addr_zext161_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                l_grpid_0_addr_zext161_reg_q <= in_l_grpid_0_addr_zext161;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_0_addr_zext161(GPOUT,89)
    out_l_grpid_0_addr_zext161 <= l_grpid_0_addr_zext161_reg_q;

    -- scalarizer_0100164_reg(REG,161)
    scalarizer_0100164_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0100164_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_0100164_reg_q <= in_scalarizer_0100164;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0100164(GPOUT,90)
    out_scalarizer_0100164 <= scalarizer_0100164_reg_q;

    -- scalarizer_0100374_reg(REG,162)
    scalarizer_0100374_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0100374_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_0100374_reg_q <= in_scalarizer_0100374;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0100374(GPOUT,91)
    out_scalarizer_0100374 <= scalarizer_0100374_reg_q;

    -- scalarizer_0100584_reg(REG,163)
    scalarizer_0100584_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0100584_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_0100584_reg_q <= in_scalarizer_0100584;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0100584(GPOUT,92)
    out_scalarizer_0100584 <= scalarizer_0100584_reg_q;

    -- scalarizer_0100794_reg(REG,164)
    scalarizer_0100794_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0100794_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_0100794_reg_q <= in_scalarizer_0100794;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0100794(GPOUT,93)
    out_scalarizer_0100794 <= scalarizer_0100794_reg_q;

    -- scalarizer_01173138_reg(REG,165)
    scalarizer_01173138_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01173138_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_01173138_reg_q <= in_scalarizer_01173138;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01173138(GPOUT,94)
    out_scalarizer_01173138 <= scalarizer_01173138_reg_q;

    -- scalarizer_01175142_reg(REG,166)
    scalarizer_01175142_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01175142_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_01175142_reg_q <= in_scalarizer_01175142;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01175142(GPOUT,95)
    out_scalarizer_01175142 <= scalarizer_01175142_reg_q;

    -- scalarizer_01177146_reg(REG,167)
    scalarizer_01177146_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01177146_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_01177146_reg_q <= in_scalarizer_01177146;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01177146(GPOUT,96)
    out_scalarizer_01177146 <= scalarizer_01177146_reg_q;

    -- scalarizer_01179150_reg(REG,168)
    scalarizer_01179150_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01179150_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_01179150_reg_q <= in_scalarizer_01179150;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01179150(GPOUT,97)
    out_scalarizer_01179150 <= scalarizer_01179150_reg_q;

    -- scalarizer_099324_reg(REG,169)
    scalarizer_099324_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_099324_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_099324_reg_q <= in_scalarizer_099324;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_099324(GPOUT,98)
    out_scalarizer_099324 <= scalarizer_099324_reg_q;

    -- scalarizer_099534_reg(REG,170)
    scalarizer_099534_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_099534_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_099534_reg_q <= in_scalarizer_099534;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_099534(GPOUT,99)
    out_scalarizer_099534 <= scalarizer_099534_reg_q;

    -- scalarizer_099744_reg(REG,171)
    scalarizer_099744_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_099744_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_099744_reg_q <= in_scalarizer_099744;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_099744(GPOUT,100)
    out_scalarizer_099744 <= scalarizer_099744_reg_q;

    -- scalarizer_099954_reg(REG,172)
    scalarizer_099954_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_099954_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_099954_reg_q <= in_scalarizer_099954;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_099954(GPOUT,101)
    out_scalarizer_099954 <= scalarizer_099954_reg_q;

    -- scalarizer_0xor1200_reg(REG,173)
    scalarizer_0xor1200_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0xor1200_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_0xor1200_reg_q <= in_scalarizer_0xor1200;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0xor1200(GPOUT,102)
    out_scalarizer_0xor1200 <= scalarizer_0xor1200_reg_q;

    -- scalarizer_1100059_reg(REG,174)
    scalarizer_1100059_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100059_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_1100059_reg_q <= in_scalarizer_1100059;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100059(GPOUT,103)
    out_scalarizer_1100059 <= scalarizer_1100059_reg_q;

    -- scalarizer_1100269_reg(REG,175)
    scalarizer_1100269_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100269_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_1100269_reg_q <= in_scalarizer_1100269;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100269(GPOUT,104)
    out_scalarizer_1100269 <= scalarizer_1100269_reg_q;

    -- scalarizer_1100479_reg(REG,176)
    scalarizer_1100479_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100479_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_1100479_reg_q <= in_scalarizer_1100479;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100479(GPOUT,105)
    out_scalarizer_1100479 <= scalarizer_1100479_reg_q;

    -- scalarizer_1100689_reg(REG,177)
    scalarizer_1100689_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100689_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_1100689_reg_q <= in_scalarizer_1100689;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100689(GPOUT,106)
    out_scalarizer_1100689 <= scalarizer_1100689_reg_q;

    -- scalarizer_1100899_reg(REG,178)
    scalarizer_1100899_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100899_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_1100899_reg_q <= in_scalarizer_1100899;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100899(GPOUT,107)
    out_scalarizer_1100899 <= scalarizer_1100899_reg_q;

    -- scalarizer_11174140_reg(REG,179)
    scalarizer_11174140_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11174140_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_11174140_reg_q <= in_scalarizer_11174140;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11174140(GPOUT,108)
    out_scalarizer_11174140 <= scalarizer_11174140_reg_q;

    -- scalarizer_11176144_reg(REG,180)
    scalarizer_11176144_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11176144_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_11176144_reg_q <= in_scalarizer_11176144;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11176144(GPOUT,109)
    out_scalarizer_11176144 <= scalarizer_11176144_reg_q;

    -- scalarizer_11178148_reg(REG,181)
    scalarizer_11178148_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11178148_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_11178148_reg_q <= in_scalarizer_11178148;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11178148(GPOUT,110)
    out_scalarizer_11178148 <= scalarizer_11178148_reg_q;

    -- scalarizer_11180152_reg(REG,182)
    scalarizer_11180152_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11180152_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_11180152_reg_q <= in_scalarizer_11180152;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11180152(GPOUT,111)
    out_scalarizer_11180152 <= scalarizer_11180152_reg_q;

    -- scalarizer_199429_reg(REG,183)
    scalarizer_199429_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_199429_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_199429_reg_q <= in_scalarizer_199429;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_199429(GPOUT,112)
    out_scalarizer_199429 <= scalarizer_199429_reg_q;

    -- scalarizer_199639_reg(REG,184)
    scalarizer_199639_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_199639_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_199639_reg_q <= in_scalarizer_199639;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_199639(GPOUT,113)
    out_scalarizer_199639 <= scalarizer_199639_reg_q;

    -- scalarizer_199849_reg(REG,185)
    scalarizer_199849_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_199849_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_199849_reg_q <= in_scalarizer_199849;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_199849(GPOUT,114)
    out_scalarizer_199849 <= scalarizer_199849_reg_q;

    -- scalarizer_1xor1201_reg(REG,186)
    scalarizer_1xor1201_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1xor1201_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_1xor1201_reg_q <= in_scalarizer_1xor1201;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1xor1201(GPOUT,115)
    out_scalarizer_1xor1201 <= scalarizer_1xor1201_reg_q;

    -- scalarizer_2xor_reg(REG,187)
    scalarizer_2xor_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_2xor_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_2xor_reg_q <= in_scalarizer_2xor;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_2xor(GPOUT,116)
    out_scalarizer_2xor <= scalarizer_2xor_reg_q;

    -- scalarizer_3xor_reg(REG,188)
    scalarizer_3xor_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_3xor_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                scalarizer_3xor_reg_q <= in_scalarizer_3xor;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_3xor(GPOUT,117)
    out_scalarizer_3xor <= scalarizer_3xor_reg_q;

    -- ethash_search_B4_branch_enable_not(LOGICAL,143)
    ethash_search_B4_branch_enable_not_q <= not (ethash_search_B4_branch_enable_q);

    -- out_stall_out(GPOUT,118)
    out_stall_out <= ethash_search_B4_branch_enable_not_q;

    -- state_0_0_cast122_reg(REG,189)
    state_0_0_cast122_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_0_0_cast122_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                state_0_0_cast122_reg_q <= in_state_0_0_cast122;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_0_0_cast122(GPOUT,119)
    out_state_0_0_cast122 <= state_0_0_cast122_reg_q;

    -- state_4_0_cast125_reg(REG,190)
    state_4_0_cast125_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_4_0_cast125_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                state_4_0_cast125_reg_q <= in_state_4_0_cast125;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_4_0_cast125(GPOUT,120)
    out_state_4_0_cast125 <= state_4_0_cast125_reg_q;

    -- state_5_0_cast128_reg(REG,191)
    state_5_0_cast128_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_5_0_cast128_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                state_5_0_cast128_reg_q <= in_state_5_0_cast128;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_5_0_cast128(GPOUT,121)
    out_state_5_0_cast128 <= state_5_0_cast128_reg_q;

    -- state_6_0_cast131_reg(REG,192)
    state_6_0_cast131_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_6_0_cast131_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                state_6_0_cast131_reg_q <= in_state_6_0_cast131;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_6_0_cast131(GPOUT,122)
    out_state_6_0_cast131 <= state_6_0_cast131_reg_q;

    -- state_7_0_cast134_reg(REG,193)
    state_7_0_cast134_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_7_0_cast134_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                state_7_0_cast134_reg_q <= in_state_7_0_cast134;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_7_0_cast134(GPOUT,123)
    out_state_7_0_cast134 <= state_7_0_cast134_reg_q;

    -- unnamed_ethash_search32_reg(REG,194)
    unnamed_ethash_search32_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            unnamed_ethash_search32_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B4_branch_enable_q = "1") THEN
                unnamed_ethash_search32_reg_q <= in_unnamed_ethash_search32;
            END IF;
        END IF;
    END PROCESS;

    -- out_unnamed_ethash_search32(GPOUT,124)
    out_unnamed_ethash_search32 <= unnamed_ethash_search32_reg_q;

    -- out_valid_out_0(GPOUT,125)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,126)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
