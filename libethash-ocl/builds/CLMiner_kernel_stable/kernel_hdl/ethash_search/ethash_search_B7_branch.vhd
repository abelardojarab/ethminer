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

-- VHDL created from ethash_search_B7_branch
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

entity ethash_search_B7_branch is
    port (
        in_c0_exe10162 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1102 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11163 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1153 : in std_logic_vector(5 downto 0);  -- ufix6
        in_c0_exe12164 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13165 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe14166 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe15167 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe16168 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe17169 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe18170 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe19171 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe20172 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe21173 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe2154 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe22174 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe23175 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe24176 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe25177 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe26178 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe27179 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe28180 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe29181 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe30182 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe31183 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3155 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe32184 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe33185 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe34186 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe35187 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe36188 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe4156 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe5157 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe6158 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe7159 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe8160 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe9161 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0191 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01232 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11233 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_10_2_cast185 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast187 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast181 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast183 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe10162 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1102 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11163 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1153 : out std_logic_vector(5 downto 0);  -- ufix6
        out_c0_exe12164 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13165 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14166 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe15167 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe16168 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17169 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe18170 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe19171 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe20172 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe21173 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe2154 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe22174 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe23175 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe24176 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe25177 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe26178 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe27179 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe28180 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe29181 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe30182 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe31183 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3155 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe32184 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe33185 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe34186 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe35187 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe4156 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5157 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6158 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7159 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe8160 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9161 : out std_logic_vector(31 downto 0);  -- ufix32
        out_global_id_0191 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01232 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11233 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_10_2_cast185 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_11_2_cast187 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_8_2_cast181 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_9_2_cast183 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B7_branch;

architecture normal of ethash_search_B7_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe10162_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1102_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11163_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1153_reg_q : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_exe12164_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe13165_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe14166_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe15167_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe16168_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe17169_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe18170_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe19171_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe20172_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe21173_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe2154_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe22174_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe23175_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe24176_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe25177_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe26178_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe27179_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe28180_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe29181_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe30182_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe31183_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe3155_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe32184_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe33185_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe34186_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe35187_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe36188_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe4156_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe5157_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe6158_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe7159_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe8160_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe9161_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_0191_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_02_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01232_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11233_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal state_10_2_cast185_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_11_2_cast187_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_8_2_cast181_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_9_2_cast183_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,92)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe36188_cmp(LOGICAL,32)
    c0_exe36188_cmp_q <= not (in_c0_exe36188);

    -- valid_out_1_and(LOGICAL,153)
    valid_out_1_and_q <= in_valid_in and c0_exe36188_cmp_q;

    -- valid_1_reg(REG,151)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,94)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,96)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,91)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,152)
    valid_out_0_and_q <= in_valid_in and in_c0_exe36188;

    -- valid_0_reg(REG,150)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,93)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,95)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- ethash_search_B7_branch_enable(LOGICAL,39)
    ethash_search_B7_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe10162_reg(REG,2)
    c0_exe10162_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe10162_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe10162_reg_q <= in_c0_exe10162;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe10162(GPOUT,97)
    out_c0_exe10162 <= c0_exe10162_reg_q;

    -- c0_exe1102_reg(REG,3)
    c0_exe1102_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1102_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe1102_reg_q <= in_c0_exe1102;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1102(GPOUT,98)
    out_c0_exe1102 <= c0_exe1102_reg_q;

    -- c0_exe11163_reg(REG,4)
    c0_exe11163_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11163_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe11163_reg_q <= in_c0_exe11163;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11163(GPOUT,99)
    out_c0_exe11163 <= c0_exe11163_reg_q;

    -- c0_exe1153_reg(REG,5)
    c0_exe1153_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1153_reg_q <= "000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe1153_reg_q <= in_c0_exe1153;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1153(GPOUT,100)
    out_c0_exe1153 <= c0_exe1153_reg_q;

    -- c0_exe12164_reg(REG,6)
    c0_exe12164_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe12164_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe12164_reg_q <= in_c0_exe12164;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe12164(GPOUT,101)
    out_c0_exe12164 <= c0_exe12164_reg_q;

    -- c0_exe13165_reg(REG,7)
    c0_exe13165_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe13165_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe13165_reg_q <= in_c0_exe13165;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe13165(GPOUT,102)
    out_c0_exe13165 <= c0_exe13165_reg_q;

    -- c0_exe14166_reg(REG,8)
    c0_exe14166_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe14166_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe14166_reg_q <= in_c0_exe14166;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe14166(GPOUT,103)
    out_c0_exe14166 <= c0_exe14166_reg_q;

    -- c0_exe15167_reg(REG,9)
    c0_exe15167_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe15167_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe15167_reg_q <= in_c0_exe15167;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe15167(GPOUT,104)
    out_c0_exe15167 <= c0_exe15167_reg_q;

    -- c0_exe16168_reg(REG,10)
    c0_exe16168_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe16168_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe16168_reg_q <= in_c0_exe16168;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe16168(GPOUT,105)
    out_c0_exe16168 <= c0_exe16168_reg_q;

    -- c0_exe17169_reg(REG,11)
    c0_exe17169_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe17169_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe17169_reg_q <= in_c0_exe17169;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe17169(GPOUT,106)
    out_c0_exe17169 <= c0_exe17169_reg_q;

    -- c0_exe18170_reg(REG,12)
    c0_exe18170_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe18170_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe18170_reg_q <= in_c0_exe18170;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe18170(GPOUT,107)
    out_c0_exe18170 <= c0_exe18170_reg_q;

    -- c0_exe19171_reg(REG,13)
    c0_exe19171_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe19171_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe19171_reg_q <= in_c0_exe19171;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe19171(GPOUT,108)
    out_c0_exe19171 <= c0_exe19171_reg_q;

    -- c0_exe20172_reg(REG,14)
    c0_exe20172_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe20172_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe20172_reg_q <= in_c0_exe20172;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe20172(GPOUT,109)
    out_c0_exe20172 <= c0_exe20172_reg_q;

    -- c0_exe21173_reg(REG,15)
    c0_exe21173_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe21173_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe21173_reg_q <= in_c0_exe21173;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe21173(GPOUT,110)
    out_c0_exe21173 <= c0_exe21173_reg_q;

    -- c0_exe2154_reg(REG,16)
    c0_exe2154_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe2154_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe2154_reg_q <= in_c0_exe2154;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe2154(GPOUT,111)
    out_c0_exe2154 <= c0_exe2154_reg_q;

    -- c0_exe22174_reg(REG,17)
    c0_exe22174_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe22174_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe22174_reg_q <= in_c0_exe22174;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe22174(GPOUT,112)
    out_c0_exe22174 <= c0_exe22174_reg_q;

    -- c0_exe23175_reg(REG,18)
    c0_exe23175_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe23175_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe23175_reg_q <= in_c0_exe23175;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe23175(GPOUT,113)
    out_c0_exe23175 <= c0_exe23175_reg_q;

    -- c0_exe24176_reg(REG,19)
    c0_exe24176_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe24176_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe24176_reg_q <= in_c0_exe24176;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe24176(GPOUT,114)
    out_c0_exe24176 <= c0_exe24176_reg_q;

    -- c0_exe25177_reg(REG,20)
    c0_exe25177_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe25177_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe25177_reg_q <= in_c0_exe25177;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe25177(GPOUT,115)
    out_c0_exe25177 <= c0_exe25177_reg_q;

    -- c0_exe26178_reg(REG,21)
    c0_exe26178_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe26178_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe26178_reg_q <= in_c0_exe26178;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe26178(GPOUT,116)
    out_c0_exe26178 <= c0_exe26178_reg_q;

    -- c0_exe27179_reg(REG,22)
    c0_exe27179_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe27179_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe27179_reg_q <= in_c0_exe27179;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe27179(GPOUT,117)
    out_c0_exe27179 <= c0_exe27179_reg_q;

    -- c0_exe28180_reg(REG,23)
    c0_exe28180_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe28180_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe28180_reg_q <= in_c0_exe28180;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe28180(GPOUT,118)
    out_c0_exe28180 <= c0_exe28180_reg_q;

    -- c0_exe29181_reg(REG,24)
    c0_exe29181_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe29181_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe29181_reg_q <= in_c0_exe29181;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe29181(GPOUT,119)
    out_c0_exe29181 <= c0_exe29181_reg_q;

    -- c0_exe30182_reg(REG,25)
    c0_exe30182_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe30182_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe30182_reg_q <= in_c0_exe30182;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe30182(GPOUT,120)
    out_c0_exe30182 <= c0_exe30182_reg_q;

    -- c0_exe31183_reg(REG,26)
    c0_exe31183_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe31183_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe31183_reg_q <= in_c0_exe31183;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe31183(GPOUT,121)
    out_c0_exe31183 <= c0_exe31183_reg_q;

    -- c0_exe3155_reg(REG,27)
    c0_exe3155_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe3155_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe3155_reg_q <= in_c0_exe3155;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe3155(GPOUT,122)
    out_c0_exe3155 <= c0_exe3155_reg_q;

    -- c0_exe32184_reg(REG,28)
    c0_exe32184_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe32184_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe32184_reg_q <= in_c0_exe32184;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe32184(GPOUT,123)
    out_c0_exe32184 <= c0_exe32184_reg_q;

    -- c0_exe33185_reg(REG,29)
    c0_exe33185_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe33185_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe33185_reg_q <= in_c0_exe33185;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe33185(GPOUT,124)
    out_c0_exe33185 <= c0_exe33185_reg_q;

    -- c0_exe34186_reg(REG,30)
    c0_exe34186_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe34186_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe34186_reg_q <= in_c0_exe34186;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe34186(GPOUT,125)
    out_c0_exe34186 <= c0_exe34186_reg_q;

    -- c0_exe35187_reg(REG,31)
    c0_exe35187_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe35187_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe35187_reg_q <= in_c0_exe35187;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe35187(GPOUT,126)
    out_c0_exe35187 <= c0_exe35187_reg_q;

    -- c0_exe4156_reg(REG,33)
    c0_exe4156_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe4156_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe4156_reg_q <= in_c0_exe4156;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe4156(GPOUT,127)
    out_c0_exe4156 <= c0_exe4156_reg_q;

    -- c0_exe5157_reg(REG,34)
    c0_exe5157_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe5157_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe5157_reg_q <= in_c0_exe5157;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe5157(GPOUT,128)
    out_c0_exe5157 <= c0_exe5157_reg_q;

    -- c0_exe6158_reg(REG,35)
    c0_exe6158_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe6158_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe6158_reg_q <= in_c0_exe6158;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe6158(GPOUT,129)
    out_c0_exe6158 <= c0_exe6158_reg_q;

    -- c0_exe7159_reg(REG,36)
    c0_exe7159_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe7159_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe7159_reg_q <= in_c0_exe7159;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe7159(GPOUT,130)
    out_c0_exe7159 <= c0_exe7159_reg_q;

    -- c0_exe8160_reg(REG,37)
    c0_exe8160_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe8160_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe8160_reg_q <= in_c0_exe8160;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe8160(GPOUT,131)
    out_c0_exe8160 <= c0_exe8160_reg_q;

    -- c0_exe9161_reg(REG,38)
    c0_exe9161_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe9161_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                c0_exe9161_reg_q <= in_c0_exe9161;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe9161(GPOUT,132)
    out_c0_exe9161 <= c0_exe9161_reg_q;

    -- global_id_0191_reg(REG,41)
    global_id_0191_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            global_id_0191_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                global_id_0191_reg_q <= in_global_id_0191;
            END IF;
        END IF;
    END PROCESS;

    -- out_global_id_0191(GPOUT,133)
    out_global_id_0191 <= global_id_0191_reg_q;

    -- l_grpid_02_reg(REG,90)
    l_grpid_02_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_grpid_02_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                l_grpid_02_reg_q <= in_l_grpid_02;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_grpid_02(GPOUT,134)
    out_l_grpid_02 <= l_grpid_02_reg_q;

    -- scalarizer_01232_reg(REG,144)
    scalarizer_01232_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_01232_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                scalarizer_01232_reg_q <= in_scalarizer_01232;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_01232(GPOUT,135)
    out_scalarizer_01232 <= scalarizer_01232_reg_q;

    -- scalarizer_11233_reg(REG,145)
    scalarizer_11233_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            scalarizer_11233_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                scalarizer_11233_reg_q <= in_scalarizer_11233;
            END IF;
        END IF;
    END PROCESS;

    -- out_scalarizer_11233(GPOUT,136)
    out_scalarizer_11233 <= scalarizer_11233_reg_q;

    -- ethash_search_B7_branch_enable_not(LOGICAL,40)
    ethash_search_B7_branch_enable_not_q <= not (ethash_search_B7_branch_enable_q);

    -- out_stall_out(GPOUT,137)
    out_stall_out <= ethash_search_B7_branch_enable_not_q;

    -- state_10_2_cast185_reg(REG,146)
    state_10_2_cast185_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_10_2_cast185_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                state_10_2_cast185_reg_q <= in_state_10_2_cast185;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_10_2_cast185(GPOUT,138)
    out_state_10_2_cast185 <= state_10_2_cast185_reg_q;

    -- state_11_2_cast187_reg(REG,147)
    state_11_2_cast187_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_11_2_cast187_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                state_11_2_cast187_reg_q <= in_state_11_2_cast187;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_11_2_cast187(GPOUT,139)
    out_state_11_2_cast187 <= state_11_2_cast187_reg_q;

    -- state_8_2_cast181_reg(REG,148)
    state_8_2_cast181_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_8_2_cast181_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                state_8_2_cast181_reg_q <= in_state_8_2_cast181;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_8_2_cast181(GPOUT,140)
    out_state_8_2_cast181 <= state_8_2_cast181_reg_q;

    -- state_9_2_cast183_reg(REG,149)
    state_9_2_cast183_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            state_9_2_cast183_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_search_B7_branch_enable_q = "1") THEN
                state_9_2_cast183_reg_q <= in_state_9_2_cast183;
            END IF;
        END IF;
    END PROCESS;

    -- out_state_9_2_cast183(GPOUT,141)
    out_state_9_2_cast183 <= state_9_2_cast183_reg_q;

    -- out_valid_out_0(GPOUT,142)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,143)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
