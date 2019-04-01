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

-- VHDL created from ethash_search_B5_branch
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

entity ethash_search_B5_branch is
    port (
        in_acl_1413 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1414 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1415 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1416 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1104 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2109 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3113 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4117 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_exitcond14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_next13 : in std_logic_vector(3 downto 0);  -- ufix4
        in_global_id_0193 : in std_logic_vector(31 downto 0);  -- ufix32
        in_inc123 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_04 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100163 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100373 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100583 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100793 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099323 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099533 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099743 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099953 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100058 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100268 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100478 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100688 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100898 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199428 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199638 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199848 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_0_0_cast121 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast124 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast127 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast130 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast133 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_1413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1414 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1415 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1416 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1104 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2109 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3113 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4117 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_fpgaindvars_iv_next13 : out std_logic_vector(3 downto 0);  -- ufix4
        out_global_id_0193 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc123 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100163 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100373 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100583 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100793 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099323 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099533 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099743 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099953 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100058 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100268 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100478 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100688 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100898 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199428 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199638 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199848 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast121 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast124 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast127 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast130 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast133 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B5_branch;

architecture normal of ethash_search_B5_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_1413_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_1414_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_1415_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_1416_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1104_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2109_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe3113_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe4117_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe1_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe2_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe3_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe4_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_next13_reg_q : STD_LOGIC_VECTOR (3 downto 0);
    signal global_id_0193_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal inc123_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_04_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr10_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100163_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100373_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100583_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100793_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099323_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099533_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099743_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099953_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100058_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100268_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100478_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100688_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100898_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199428_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199638_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199848_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal state_0_0_cast121_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_4_0_cast124_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_5_0_cast127_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_6_0_cast130_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_7_0_cast133_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,65)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- exitcond14_cmp(LOGICAL,16)
    exitcond14_cmp_q <= not (in_exitcond14);

    -- valid_out_1_and(LOGICAL,135)
    valid_out_1_and_q <= in_valid_in and exitcond14_cmp_q;

    -- valid_1_reg(REG,133)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,67)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,69)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,64)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,134)
    valid_out_0_and_q <= in_valid_in and in_exitcond14;

    -- valid_0_reg(REG,132)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,66)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,68)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- ethash_search_B5_branch_enable(LOGICAL,14)
    ethash_search_B5_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- acl_1413_reg(REG,2)
    acl_1413_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_1413_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                acl_1413_reg_q <= in_acl_1413;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_1413(GPOUT,70)
    out_acl_1413 <= acl_1413_reg_q;

    -- acl_1414_reg(REG,3)
    acl_1414_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_1414_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                acl_1414_reg_q <= in_acl_1414;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_1414(GPOUT,71)
    out_acl_1414 <= acl_1414_reg_q;

    -- acl_1415_reg(REG,4)
    acl_1415_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_1415_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                acl_1415_reg_q <= in_acl_1415;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_1415(GPOUT,72)
    out_acl_1415 <= acl_1415_reg_q;

    -- acl_1416_reg(REG,5)
    acl_1416_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_1416_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                acl_1416_reg_q <= in_acl_1416;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_1416(GPOUT,73)
    out_acl_1416 <= acl_1416_reg_q;

    -- c0_exe1104_reg(REG,6)
    c0_exe1104_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1104_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                c0_exe1104_reg_q <= in_c0_exe1104;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1104(GPOUT,74)
    out_c0_exe1104 <= c0_exe1104_reg_q;

    -- c0_exe2109_reg(REG,7)
    c0_exe2109_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2109_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                c0_exe2109_reg_q <= in_c0_exe2109;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2109(GPOUT,75)
    out_c0_exe2109 <= c0_exe2109_reg_q;

    -- c0_exe3113_reg(REG,8)
    c0_exe3113_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe3113_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                c0_exe3113_reg_q <= in_c0_exe3113;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe3113(GPOUT,76)
    out_c0_exe3113 <= c0_exe3113_reg_q;

    -- c0_exe4117_reg(REG,9)
    c0_exe4117_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe4117_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                c0_exe4117_reg_q <= in_c0_exe4117;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe4117(GPOUT,77)
    out_c0_exe4117 <= c0_exe4117_reg_q;

    -- c1_exe1_reg(REG,10)
    c1_exe1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe1_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                c1_exe1_reg_q <= in_c1_exe1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe1(GPOUT,78)
    out_c1_exe1 <= c1_exe1_reg_q;

    -- c1_exe2_reg(REG,11)
    c1_exe2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe2_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                c1_exe2_reg_q <= in_c1_exe2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe2(GPOUT,79)
    out_c1_exe2 <= c1_exe2_reg_q;

    -- c1_exe3_reg(REG,12)
    c1_exe3_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe3_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                c1_exe3_reg_q <= in_c1_exe3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe3(GPOUT,80)
    out_c1_exe3 <= c1_exe3_reg_q;

    -- c1_exe4_reg(REG,13)
    c1_exe4_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe4_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                c1_exe4_reg_q <= in_c1_exe4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe4(GPOUT,81)
    out_c1_exe4 <= c1_exe4_reg_q;

    -- fpgaindvars_iv_next13_reg(REG,17)
    fpgaindvars_iv_next13_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv_next13_reg_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                fpgaindvars_iv_next13_reg_q <= in_fpgaindvars_iv_next13;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv_next13(GPOUT,82)
    out_fpgaindvars_iv_next13 <= fpgaindvars_iv_next13_reg_q;

    -- global_id_0193_reg(REG,18)
    global_id_0193_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            global_id_0193_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                global_id_0193_reg_q <= in_global_id_0193;
            END IF;
        END IF;
    END PROCESS;

    -- out_global_id_0193(GPOUT,83)
    out_global_id_0193 <= global_id_0193_reg_q;

    -- inc123_reg(REG,19)
    inc123_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc123_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                inc123_reg_q <= in_inc123;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc123(GPOUT,84)
    out_inc123 <= inc123_reg_q;

    -- l_grpid_04_reg(REG,62)
    l_grpid_04_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_04_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                l_grpid_04_reg_q <= in_l_grpid_04;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_04(GPOUT,85)
    out_l_grpid_04 <= l_grpid_04_reg_q;

    -- l_grpid_0_addr10_reg(REG,63)
    l_grpid_0_addr10_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_0_addr10_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                l_grpid_0_addr10_reg_q <= in_l_grpid_0_addr10;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_0_addr10(GPOUT,86)
    out_l_grpid_0_addr10 <= l_grpid_0_addr10_reg_q;

    -- scalarizer_0100163_reg(REG,111)
    scalarizer_0100163_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0100163_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_0100163_reg_q <= in_scalarizer_0100163;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0100163(GPOUT,87)
    out_scalarizer_0100163 <= scalarizer_0100163_reg_q;

    -- scalarizer_0100373_reg(REG,112)
    scalarizer_0100373_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0100373_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_0100373_reg_q <= in_scalarizer_0100373;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0100373(GPOUT,88)
    out_scalarizer_0100373 <= scalarizer_0100373_reg_q;

    -- scalarizer_0100583_reg(REG,113)
    scalarizer_0100583_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0100583_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_0100583_reg_q <= in_scalarizer_0100583;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0100583(GPOUT,89)
    out_scalarizer_0100583 <= scalarizer_0100583_reg_q;

    -- scalarizer_0100793_reg(REG,114)
    scalarizer_0100793_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_0100793_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_0100793_reg_q <= in_scalarizer_0100793;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_0100793(GPOUT,90)
    out_scalarizer_0100793 <= scalarizer_0100793_reg_q;

    -- scalarizer_099323_reg(REG,115)
    scalarizer_099323_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_099323_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_099323_reg_q <= in_scalarizer_099323;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_099323(GPOUT,91)
    out_scalarizer_099323 <= scalarizer_099323_reg_q;

    -- scalarizer_099533_reg(REG,116)
    scalarizer_099533_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_099533_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_099533_reg_q <= in_scalarizer_099533;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_099533(GPOUT,92)
    out_scalarizer_099533 <= scalarizer_099533_reg_q;

    -- scalarizer_099743_reg(REG,117)
    scalarizer_099743_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_099743_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_099743_reg_q <= in_scalarizer_099743;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_099743(GPOUT,93)
    out_scalarizer_099743 <= scalarizer_099743_reg_q;

    -- scalarizer_099953_reg(REG,118)
    scalarizer_099953_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_099953_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_099953_reg_q <= in_scalarizer_099953;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_099953(GPOUT,94)
    out_scalarizer_099953 <= scalarizer_099953_reg_q;

    -- scalarizer_1100058_reg(REG,119)
    scalarizer_1100058_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100058_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_1100058_reg_q <= in_scalarizer_1100058;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100058(GPOUT,95)
    out_scalarizer_1100058 <= scalarizer_1100058_reg_q;

    -- scalarizer_1100268_reg(REG,120)
    scalarizer_1100268_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100268_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_1100268_reg_q <= in_scalarizer_1100268;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100268(GPOUT,96)
    out_scalarizer_1100268 <= scalarizer_1100268_reg_q;

    -- scalarizer_1100478_reg(REG,121)
    scalarizer_1100478_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100478_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_1100478_reg_q <= in_scalarizer_1100478;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100478(GPOUT,97)
    out_scalarizer_1100478 <= scalarizer_1100478_reg_q;

    -- scalarizer_1100688_reg(REG,122)
    scalarizer_1100688_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100688_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_1100688_reg_q <= in_scalarizer_1100688;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100688(GPOUT,98)
    out_scalarizer_1100688 <= scalarizer_1100688_reg_q;

    -- scalarizer_1100898_reg(REG,123)
    scalarizer_1100898_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_1100898_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_1100898_reg_q <= in_scalarizer_1100898;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_1100898(GPOUT,99)
    out_scalarizer_1100898 <= scalarizer_1100898_reg_q;

    -- scalarizer_199428_reg(REG,124)
    scalarizer_199428_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_199428_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_199428_reg_q <= in_scalarizer_199428;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_199428(GPOUT,100)
    out_scalarizer_199428 <= scalarizer_199428_reg_q;

    -- scalarizer_199638_reg(REG,125)
    scalarizer_199638_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_199638_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_199638_reg_q <= in_scalarizer_199638;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_199638(GPOUT,101)
    out_scalarizer_199638 <= scalarizer_199638_reg_q;

    -- scalarizer_199848_reg(REG,126)
    scalarizer_199848_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_199848_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                scalarizer_199848_reg_q <= in_scalarizer_199848;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_199848(GPOUT,102)
    out_scalarizer_199848 <= scalarizer_199848_reg_q;

    -- ethash_search_B5_branch_enable_not(LOGICAL,15)
    ethash_search_B5_branch_enable_not_q <= not (ethash_search_B5_branch_enable_q);

    -- out_stall_out(GPOUT,103)
    out_stall_out <= ethash_search_B5_branch_enable_not_q;

    -- state_0_0_cast121_reg(REG,127)
    state_0_0_cast121_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_0_0_cast121_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                state_0_0_cast121_reg_q <= in_state_0_0_cast121;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_0_0_cast121(GPOUT,104)
    out_state_0_0_cast121 <= state_0_0_cast121_reg_q;

    -- state_4_0_cast124_reg(REG,128)
    state_4_0_cast124_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_4_0_cast124_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                state_4_0_cast124_reg_q <= in_state_4_0_cast124;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_4_0_cast124(GPOUT,105)
    out_state_4_0_cast124 <= state_4_0_cast124_reg_q;

    -- state_5_0_cast127_reg(REG,129)
    state_5_0_cast127_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_5_0_cast127_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                state_5_0_cast127_reg_q <= in_state_5_0_cast127;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_5_0_cast127(GPOUT,106)
    out_state_5_0_cast127 <= state_5_0_cast127_reg_q;

    -- state_6_0_cast130_reg(REG,130)
    state_6_0_cast130_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_6_0_cast130_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                state_6_0_cast130_reg_q <= in_state_6_0_cast130;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_6_0_cast130(GPOUT,107)
    out_state_6_0_cast130 <= state_6_0_cast130_reg_q;

    -- state_7_0_cast133_reg(REG,131)
    state_7_0_cast133_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_7_0_cast133_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B5_branch_enable_q = "1") THEN
                state_7_0_cast133_reg_q <= in_state_7_0_cast133;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_7_0_cast133(GPOUT,108)
    out_state_7_0_cast133 <= state_7_0_cast133_reg_q;

    -- out_valid_out_0(GPOUT,109)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,110)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
