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

-- VHDL created from ethash_search_B3_merge_reg
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

entity ethash_search_B3_merge_reg is
    port (
        in_data_in_0 : in std_logic_vector(3 downto 0);  -- ufix4
        in_data_in_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_5 : in std_logic_vector(31 downto 0);  -- ufix32
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
        in_data_in_28 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_29 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_30 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_31 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_32 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_33 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_34 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_35 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_36 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(3 downto 0);  -- ufix4
        out_data_out_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_5 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_data_out_28 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_29 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_30 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_31 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_32 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_33 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_34 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_35 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_36 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B3_merge_reg;

architecture normal of ethash_search_B3_merge_reg is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_0_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_4_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_5_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_6_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_7_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_8_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_9_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_10_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_12_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_13_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_14_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_15_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_16_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_17_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_18_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_19_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_20_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_21_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_22_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_23_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_24_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_25_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_26_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_27_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_28_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_29_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_30_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_31_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_32_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_33_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_34_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_35_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_36_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_data_reg_37_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_valid_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_reg_valid_reg_and_stall_in_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_reg_valid_reg_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_in_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- stall_in_not(LOGICAL,45)
    stall_in_not_q <= not (in_stall_in);

    -- ethash_search_B3_merge_reg_valid_reg_not(LOGICAL,44)
    ethash_search_B3_merge_reg_valid_reg_not_q <= not (ethash_search_B3_merge_reg_valid_reg_q);

    -- stall_in_not_or_ethash_search_B3_merge_reg_valid_reg(LOGICAL,46)
    stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q <= ethash_search_B3_merge_reg_valid_reg_not_q or stall_in_not_q;

    -- ethash_search_B3_merge_reg_valid_reg(REG,42)
    ethash_search_B3_merge_reg_valid_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_valid_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_valid_reg_q <= in_valid_in;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_37_x(REG,41)
    ethash_search_B3_merge_reg_data_reg_37_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_37_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_37_x_q <= in_data_in_37;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_36_x(REG,40)
    ethash_search_B3_merge_reg_data_reg_36_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_36_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_36_x_q <= in_data_in_36;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_35_x(REG,39)
    ethash_search_B3_merge_reg_data_reg_35_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_35_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_35_x_q <= in_data_in_35;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_34_x(REG,38)
    ethash_search_B3_merge_reg_data_reg_34_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_34_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_34_x_q <= in_data_in_34;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_33_x(REG,37)
    ethash_search_B3_merge_reg_data_reg_33_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_33_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_33_x_q <= in_data_in_33;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_32_x(REG,36)
    ethash_search_B3_merge_reg_data_reg_32_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_32_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_32_x_q <= in_data_in_32;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_31_x(REG,35)
    ethash_search_B3_merge_reg_data_reg_31_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_31_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_31_x_q <= in_data_in_31;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_30_x(REG,34)
    ethash_search_B3_merge_reg_data_reg_30_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_30_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_30_x_q <= in_data_in_30;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_29_x(REG,33)
    ethash_search_B3_merge_reg_data_reg_29_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_29_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_29_x_q <= in_data_in_29;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_28_x(REG,32)
    ethash_search_B3_merge_reg_data_reg_28_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_28_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_28_x_q <= in_data_in_28;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_27_x(REG,31)
    ethash_search_B3_merge_reg_data_reg_27_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_27_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_27_x_q <= in_data_in_27;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_26_x(REG,30)
    ethash_search_B3_merge_reg_data_reg_26_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_26_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_26_x_q <= in_data_in_26;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_25_x(REG,29)
    ethash_search_B3_merge_reg_data_reg_25_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_25_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_25_x_q <= in_data_in_25;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_24_x(REG,28)
    ethash_search_B3_merge_reg_data_reg_24_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_24_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_24_x_q <= in_data_in_24;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_23_x(REG,27)
    ethash_search_B3_merge_reg_data_reg_23_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_23_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_23_x_q <= in_data_in_23;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_22_x(REG,26)
    ethash_search_B3_merge_reg_data_reg_22_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_22_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_22_x_q <= in_data_in_22;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_21_x(REG,25)
    ethash_search_B3_merge_reg_data_reg_21_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_21_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_21_x_q <= in_data_in_21;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_20_x(REG,24)
    ethash_search_B3_merge_reg_data_reg_20_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_20_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_20_x_q <= in_data_in_20;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_19_x(REG,23)
    ethash_search_B3_merge_reg_data_reg_19_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_19_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_19_x_q <= in_data_in_19;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_18_x(REG,22)
    ethash_search_B3_merge_reg_data_reg_18_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_18_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_18_x_q <= in_data_in_18;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_17_x(REG,21)
    ethash_search_B3_merge_reg_data_reg_17_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_17_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_17_x_q <= in_data_in_17;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_16_x(REG,20)
    ethash_search_B3_merge_reg_data_reg_16_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_16_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_16_x_q <= in_data_in_16;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_15_x(REG,19)
    ethash_search_B3_merge_reg_data_reg_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_15_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_15_x_q <= in_data_in_15;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_14_x(REG,18)
    ethash_search_B3_merge_reg_data_reg_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_14_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_14_x_q <= in_data_in_14;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_13_x(REG,17)
    ethash_search_B3_merge_reg_data_reg_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_13_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_13_x_q <= in_data_in_13;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_12_x(REG,16)
    ethash_search_B3_merge_reg_data_reg_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_12_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_12_x_q <= in_data_in_12;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_11_x(REG,15)
    ethash_search_B3_merge_reg_data_reg_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_11_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_11_x_q <= in_data_in_11;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_10_x(REG,14)
    ethash_search_B3_merge_reg_data_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_10_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_10_x_q <= in_data_in_10;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_9_x(REG,13)
    ethash_search_B3_merge_reg_data_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_9_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_9_x_q <= in_data_in_9;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_8_x(REG,12)
    ethash_search_B3_merge_reg_data_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_8_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_8_x_q <= in_data_in_8;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_7_x(REG,11)
    ethash_search_B3_merge_reg_data_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_7_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_7_x_q <= in_data_in_7;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_6_x(REG,10)
    ethash_search_B3_merge_reg_data_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_6_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_6_x_q <= in_data_in_6;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_5_x(REG,9)
    ethash_search_B3_merge_reg_data_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_5_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_5_x_q <= in_data_in_5;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_4_x(REG,8)
    ethash_search_B3_merge_reg_data_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_4_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_4_x_q <= in_data_in_4;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_3_x(REG,7)
    ethash_search_B3_merge_reg_data_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_3_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_3_x_q <= in_data_in_3;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_2_x(REG,6)
    ethash_search_B3_merge_reg_data_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_2_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_2_x_q <= in_data_in_2;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_1_x(REG,5)
    ethash_search_B3_merge_reg_data_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_1_x_q <= in_data_in_1;
            END IF;
        END IF;
    END PROCESS;

    -- ethash_search_B3_merge_reg_data_reg_0_x(REG,4)
    ethash_search_B3_merge_reg_data_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ethash_search_B3_merge_reg_data_reg_0_x_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_ethash_search_B3_merge_reg_valid_reg_q = "1") THEN
                ethash_search_B3_merge_reg_data_reg_0_x_q <= in_data_in_0;
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@1
    out_data_out_0 <= ethash_search_B3_merge_reg_data_reg_0_x_q;
    out_data_out_1 <= ethash_search_B3_merge_reg_data_reg_1_x_q;
    out_data_out_2 <= ethash_search_B3_merge_reg_data_reg_2_x_q;
    out_data_out_3 <= ethash_search_B3_merge_reg_data_reg_3_x_q;
    out_data_out_4 <= ethash_search_B3_merge_reg_data_reg_4_x_q;
    out_data_out_5 <= ethash_search_B3_merge_reg_data_reg_5_x_q;
    out_data_out_6 <= ethash_search_B3_merge_reg_data_reg_6_x_q;
    out_data_out_7 <= ethash_search_B3_merge_reg_data_reg_7_x_q;
    out_data_out_8 <= ethash_search_B3_merge_reg_data_reg_8_x_q;
    out_data_out_9 <= ethash_search_B3_merge_reg_data_reg_9_x_q;
    out_data_out_10 <= ethash_search_B3_merge_reg_data_reg_10_x_q;
    out_data_out_11 <= ethash_search_B3_merge_reg_data_reg_11_x_q;
    out_data_out_12 <= ethash_search_B3_merge_reg_data_reg_12_x_q;
    out_data_out_13 <= ethash_search_B3_merge_reg_data_reg_13_x_q;
    out_data_out_14 <= ethash_search_B3_merge_reg_data_reg_14_x_q;
    out_data_out_15 <= ethash_search_B3_merge_reg_data_reg_15_x_q;
    out_data_out_16 <= ethash_search_B3_merge_reg_data_reg_16_x_q;
    out_data_out_17 <= ethash_search_B3_merge_reg_data_reg_17_x_q;
    out_data_out_18 <= ethash_search_B3_merge_reg_data_reg_18_x_q;
    out_data_out_19 <= ethash_search_B3_merge_reg_data_reg_19_x_q;
    out_data_out_20 <= ethash_search_B3_merge_reg_data_reg_20_x_q;
    out_data_out_21 <= ethash_search_B3_merge_reg_data_reg_21_x_q;
    out_data_out_22 <= ethash_search_B3_merge_reg_data_reg_22_x_q;
    out_data_out_23 <= ethash_search_B3_merge_reg_data_reg_23_x_q;
    out_data_out_24 <= ethash_search_B3_merge_reg_data_reg_24_x_q;
    out_data_out_25 <= ethash_search_B3_merge_reg_data_reg_25_x_q;
    out_data_out_26 <= ethash_search_B3_merge_reg_data_reg_26_x_q;
    out_data_out_27 <= ethash_search_B3_merge_reg_data_reg_27_x_q;
    out_data_out_28 <= ethash_search_B3_merge_reg_data_reg_28_x_q;
    out_data_out_29 <= ethash_search_B3_merge_reg_data_reg_29_x_q;
    out_data_out_30 <= ethash_search_B3_merge_reg_data_reg_30_x_q;
    out_data_out_31 <= ethash_search_B3_merge_reg_data_reg_31_x_q;
    out_data_out_32 <= ethash_search_B3_merge_reg_data_reg_32_x_q;
    out_data_out_33 <= ethash_search_B3_merge_reg_data_reg_33_x_q;
    out_data_out_34 <= ethash_search_B3_merge_reg_data_reg_34_x_q;
    out_data_out_35 <= ethash_search_B3_merge_reg_data_reg_35_x_q;
    out_data_out_36 <= ethash_search_B3_merge_reg_data_reg_36_x_q;
    out_data_out_37 <= ethash_search_B3_merge_reg_data_reg_37_x_q;
    out_valid_out <= ethash_search_B3_merge_reg_valid_reg_q;

    -- ethash_search_B3_merge_reg_valid_reg_and_stall_in(LOGICAL,43)
    ethash_search_B3_merge_reg_valid_reg_and_stall_in_q <= ethash_search_B3_merge_reg_valid_reg_q and in_stall_in;

    -- sync_out(GPOUT,48)@20000000
    out_stall_out <= ethash_search_B3_merge_reg_valid_reg_and_stall_in_q;

END normal;
