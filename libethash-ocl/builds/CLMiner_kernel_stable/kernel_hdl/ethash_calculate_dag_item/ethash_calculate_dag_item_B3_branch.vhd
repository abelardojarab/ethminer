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

-- VHDL created from ethash_calculate_dag_item_B3_branch
-- VHDL created on Mon Apr  1 13:52:57 2019


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

entity ethash_calculate_dag_item_B3_branch is
    port (
        in_c1_exit_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_9 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_14 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit_19 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit_20 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_acl_hw_wg_id41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11221 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe114 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21326 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe20 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c1_exe3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_fpgaindvars_iv_next : in std_logic_vector(8 downto 0);  -- ufix9
        in_inc43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_9 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_14 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_19 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit_20 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_acl_hw_wg_id41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11221 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21326 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe20 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c1_exe3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_fpgaindvars_iv_next : out std_logic_vector(8 downto 0);  -- ufix9
        out_inc43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B3_branch;

architecture normal of ethash_calculate_dag_item_B3_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_4_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_5_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_6_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_7_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_8_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_9_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal c1_exit_reg_10_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_12_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_13_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_14_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal c1_exit_reg_15_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_16_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_17_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_18_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit_reg_19_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal c1_exit_reg_20_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal acl_hw_wg_id41_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11221_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe114_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe21326_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe10_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe11_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe12_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe13_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe15_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe16_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe17_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe18_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe1_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe20_reg_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal c1_exe2_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe3_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe4_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe5_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe6_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe7_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe8_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_next_reg_q : STD_LOGIC_VECTOR (8 downto 0);
    signal inc43_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_ethash_calculate_dag_item7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,144)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- unnamed_ethash_calculate_dag_item7_cmp(LOGICAL,149)
    unnamed_ethash_calculate_dag_item7_cmp_q <= not (in_unnamed_ethash_calculate_dag_item7);

    -- valid_out_1_and(LOGICAL,153)
    valid_out_1_and_q <= in_valid_in and unnamed_ethash_calculate_dag_item7_cmp_q;

    -- valid_1_reg(REG,151)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,146)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,148)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,143)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,152)
    valid_out_0_and_q <= in_valid_in and in_unnamed_ethash_calculate_dag_item7;

    -- valid_0_reg(REG,150)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,145)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,147)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- ethash_calculate_dag_item_B3_branch_enable(LOGICAL,139)
    ethash_calculate_dag_item_B3_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c1_exit_reg_0_x(REG,2)
    c1_exit_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_0_x_q <= in_c1_exit_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_0(GPOUT,71)
    out_c1_exit_0 <= c1_exit_reg_0_x_q;

    -- c1_exit_reg_1_x(REG,3)
    c1_exit_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_1_x_q <= in_c1_exit_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_1(GPOUT,72)
    out_c1_exit_1 <= c1_exit_reg_1_x_q;

    -- c1_exit_reg_2_x(REG,4)
    c1_exit_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_2_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_2_x_q <= in_c1_exit_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_2(GPOUT,73)
    out_c1_exit_2 <= c1_exit_reg_2_x_q;

    -- c1_exit_reg_3_x(REG,5)
    c1_exit_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_3_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_3_x_q <= in_c1_exit_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_3(GPOUT,74)
    out_c1_exit_3 <= c1_exit_reg_3_x_q;

    -- c1_exit_reg_4_x(REG,6)
    c1_exit_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_4_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_4_x_q <= in_c1_exit_4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_4(GPOUT,75)
    out_c1_exit_4 <= c1_exit_reg_4_x_q;

    -- c1_exit_reg_5_x(REG,7)
    c1_exit_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_5_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_5_x_q <= in_c1_exit_5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_5(GPOUT,76)
    out_c1_exit_5 <= c1_exit_reg_5_x_q;

    -- c1_exit_reg_6_x(REG,8)
    c1_exit_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_6_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_6_x_q <= in_c1_exit_6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_6(GPOUT,77)
    out_c1_exit_6 <= c1_exit_reg_6_x_q;

    -- c1_exit_reg_7_x(REG,9)
    c1_exit_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_7_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_7_x_q <= in_c1_exit_7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_7(GPOUT,78)
    out_c1_exit_7 <= c1_exit_reg_7_x_q;

    -- c1_exit_reg_8_x(REG,10)
    c1_exit_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_8_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_8_x_q <= in_c1_exit_8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_8(GPOUT,79)
    out_c1_exit_8 <= c1_exit_reg_8_x_q;

    -- c1_exit_reg_9_x(REG,11)
    c1_exit_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_9_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_9_x_q <= in_c1_exit_9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_9(GPOUT,80)
    out_c1_exit_9 <= c1_exit_reg_9_x_q;

    -- c1_exit_reg_10_x(REG,12)
    c1_exit_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_10_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_10_x_q <= in_c1_exit_10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_10(GPOUT,81)
    out_c1_exit_10 <= c1_exit_reg_10_x_q;

    -- c1_exit_reg_11_x(REG,13)
    c1_exit_reg_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_11_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_11_x_q <= in_c1_exit_11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_11(GPOUT,82)
    out_c1_exit_11 <= c1_exit_reg_11_x_q;

    -- c1_exit_reg_12_x(REG,14)
    c1_exit_reg_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_12_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_12_x_q <= in_c1_exit_12;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_12(GPOUT,83)
    out_c1_exit_12 <= c1_exit_reg_12_x_q;

    -- c1_exit_reg_13_x(REG,15)
    c1_exit_reg_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_13_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_13_x_q <= in_c1_exit_13;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_13(GPOUT,84)
    out_c1_exit_13 <= c1_exit_reg_13_x_q;

    -- c1_exit_reg_14_x(REG,16)
    c1_exit_reg_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_14_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_14_x_q <= in_c1_exit_14;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_14(GPOUT,85)
    out_c1_exit_14 <= c1_exit_reg_14_x_q;

    -- c1_exit_reg_15_x(REG,17)
    c1_exit_reg_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_15_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_15_x_q <= in_c1_exit_15;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_15(GPOUT,86)
    out_c1_exit_15 <= c1_exit_reg_15_x_q;

    -- c1_exit_reg_16_x(REG,18)
    c1_exit_reg_16_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_16_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_16_x_q <= in_c1_exit_16;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_16(GPOUT,87)
    out_c1_exit_16 <= c1_exit_reg_16_x_q;

    -- c1_exit_reg_17_x(REG,19)
    c1_exit_reg_17_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_17_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_17_x_q <= in_c1_exit_17;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_17(GPOUT,88)
    out_c1_exit_17 <= c1_exit_reg_17_x_q;

    -- c1_exit_reg_18_x(REG,20)
    c1_exit_reg_18_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_18_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_18_x_q <= in_c1_exit_18;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_18(GPOUT,89)
    out_c1_exit_18 <= c1_exit_reg_18_x_q;

    -- c1_exit_reg_19_x(REG,21)
    c1_exit_reg_19_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_19_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_19_x_q <= in_c1_exit_19;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_19(GPOUT,90)
    out_c1_exit_19 <= c1_exit_reg_19_x_q;

    -- c1_exit_reg_20_x(REG,22)
    c1_exit_reg_20_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit_reg_20_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exit_reg_20_x_q <= in_c1_exit_20;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit_20(GPOUT,91)
    out_c1_exit_20 <= c1_exit_reg_20_x_q;

    -- acl_hw_wg_id41_reg(REG,118)
    acl_hw_wg_id41_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_hw_wg_id41_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                acl_hw_wg_id41_reg_q <= in_acl_hw_wg_id41;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_hw_wg_id41(GPOUT,92)
    out_acl_hw_wg_id41 <= acl_hw_wg_id41_reg_q;

    -- c0_exe11221_reg(REG,119)
    c0_exe11221_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11221_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c0_exe11221_reg_q <= in_c0_exe11221;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11221(GPOUT,93)
    out_c0_exe11221 <= c0_exe11221_reg_q;

    -- c0_exe114_reg(REG,120)
    c0_exe114_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe114_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c0_exe114_reg_q <= in_c0_exe114;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe114(GPOUT,94)
    out_c0_exe114 <= c0_exe114_reg_q;

    -- c0_exe21326_reg(REG,121)
    c0_exe21326_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe21326_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c0_exe21326_reg_q <= in_c0_exe21326;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe21326(GPOUT,95)
    out_c0_exe21326 <= c0_exe21326_reg_q;

    -- c1_exe1_reg(REG,130)
    c1_exe1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe1_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe1_reg_q <= in_c1_exe1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe1(GPOUT,96)
    out_c1_exe1 <= c1_exe1_reg_q;

    -- c1_exe10_reg(REG,122)
    c1_exe10_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe10_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe10_reg_q <= in_c1_exe10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe10(GPOUT,97)
    out_c1_exe10 <= c1_exe10_reg_q;

    -- c1_exe11_reg(REG,123)
    c1_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe11_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe11_reg_q <= in_c1_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe11(GPOUT,98)
    out_c1_exe11 <= c1_exe11_reg_q;

    -- c1_exe12_reg(REG,124)
    c1_exe12_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe12_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe12_reg_q <= in_c1_exe12;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe12(GPOUT,99)
    out_c1_exe12 <= c1_exe12_reg_q;

    -- c1_exe13_reg(REG,125)
    c1_exe13_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe13_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe13_reg_q <= in_c1_exe13;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe13(GPOUT,100)
    out_c1_exe13 <= c1_exe13_reg_q;

    -- c1_exe15_reg(REG,126)
    c1_exe15_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe15_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe15_reg_q <= in_c1_exe15;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe15(GPOUT,101)
    out_c1_exe15 <= c1_exe15_reg_q;

    -- c1_exe16_reg(REG,127)
    c1_exe16_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe16_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe16_reg_q <= in_c1_exe16;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe16(GPOUT,102)
    out_c1_exe16 <= c1_exe16_reg_q;

    -- c1_exe17_reg(REG,128)
    c1_exe17_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe17_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe17_reg_q <= in_c1_exe17;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe17(GPOUT,103)
    out_c1_exe17 <= c1_exe17_reg_q;

    -- c1_exe18_reg(REG,129)
    c1_exe18_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe18_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe18_reg_q <= in_c1_exe18;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe18(GPOUT,104)
    out_c1_exe18 <= c1_exe18_reg_q;

    -- c1_exe2_reg(REG,132)
    c1_exe2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe2_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe2_reg_q <= in_c1_exe2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe2(GPOUT,105)
    out_c1_exe2 <= c1_exe2_reg_q;

    -- c1_exe20_reg(REG,131)
    c1_exe20_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe20_reg_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe20_reg_q <= in_c1_exe20;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe20(GPOUT,106)
    out_c1_exe20 <= c1_exe20_reg_q;

    -- c1_exe3_reg(REG,133)
    c1_exe3_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe3_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe3_reg_q <= in_c1_exe3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe3(GPOUT,107)
    out_c1_exe3 <= c1_exe3_reg_q;

    -- c1_exe4_reg(REG,134)
    c1_exe4_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe4_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe4_reg_q <= in_c1_exe4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe4(GPOUT,108)
    out_c1_exe4 <= c1_exe4_reg_q;

    -- c1_exe5_reg(REG,135)
    c1_exe5_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe5_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe5_reg_q <= in_c1_exe5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe5(GPOUT,109)
    out_c1_exe5 <= c1_exe5_reg_q;

    -- c1_exe6_reg(REG,136)
    c1_exe6_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe6_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe6_reg_q <= in_c1_exe6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe6(GPOUT,110)
    out_c1_exe6 <= c1_exe6_reg_q;

    -- c1_exe7_reg(REG,137)
    c1_exe7_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe7_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe7_reg_q <= in_c1_exe7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe7(GPOUT,111)
    out_c1_exe7 <= c1_exe7_reg_q;

    -- c1_exe8_reg(REG,138)
    c1_exe8_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe8_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                c1_exe8_reg_q <= in_c1_exe8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe8(GPOUT,112)
    out_c1_exe8 <= c1_exe8_reg_q;

    -- fpgaindvars_iv_next_reg(REG,141)
    fpgaindvars_iv_next_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv_next_reg_q <= "000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                fpgaindvars_iv_next_reg_q <= in_fpgaindvars_iv_next;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv_next(GPOUT,113)
    out_fpgaindvars_iv_next <= fpgaindvars_iv_next_reg_q;

    -- inc43_reg(REG,142)
    inc43_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc43_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B3_branch_enable_q = "1") THEN
                inc43_reg_q <= in_inc43;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc43(GPOUT,114)
    out_inc43 <= inc43_reg_q;

    -- ethash_calculate_dag_item_B3_branch_enable_not(LOGICAL,140)
    ethash_calculate_dag_item_B3_branch_enable_not_q <= not (ethash_calculate_dag_item_B3_branch_enable_q);

    -- out_stall_out(GPOUT,115)
    out_stall_out <= ethash_calculate_dag_item_B3_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,116)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,117)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
