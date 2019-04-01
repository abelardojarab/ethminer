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

-- VHDL created from dupName_1_priority_encoder_26ui0676j636g6u0qc0xajz
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

entity dupName_1_priority_encoder_26ui0676j636g6u0qc0xajz is
    port (
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_o_select : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end dupName_1_priority_encoder_26ui0676j636g6u0qc0xajz;

architecture normal of dupName_1_priority_encoder_26ui0676j636g6u0qc0xajz is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal choose_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal choose_0_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal choose_0_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal choose_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal choose_1_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal choose_1_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal choose_based_on_valids_q : STD_LOGIC_VECTOR (0 downto 0);
    signal const_wide_0_q : STD_LOGIC_VECTOR (6 downto 0);
    signal counter_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal counter_mux_q : STD_LOGIC_VECTOR (6 downto 0);
    signal enable_regs_q : STD_LOGIC_VECTOR (0 downto 0);
    signal incrementor_a : STD_LOGIC_VECTOR (7 downto 0);
    signal incrementor_b : STD_LOGIC_VECTOR (7 downto 0);
    signal incrementor_o : STD_LOGIC_VECTOR (7 downto 0);
    signal incrementor_q : STD_LOGIC_VECTOR (7 downto 0);
    signal is_merge_data_to_local_regs_valid_s : STD_LOGIC_VECTOR (0 downto 0);
    signal is_merge_data_to_local_regs_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal is_wg_through_q : STD_LOGIC_VECTOR (0 downto 0);
    signal merge_block_selector_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_choose_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_merge_block_selector_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_q : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_add_in : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_add_q : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_sub_in : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_sub_q : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_wgs_in : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_wgs_q : STD_LOGIC_VECTOR (6 downto 0);
    signal wg_limit_a : STD_LOGIC_VECTOR (7 downto 0);
    signal wg_limit_b : STD_LOGIC_VECTOR (7 downto 0);
    signal wg_limit_o : STD_LOGIC_VECTOR (7 downto 0);
    signal wg_limit_q : STD_LOGIC_VECTOR (7 downto 0);
    signal workgroup_counter_q : STD_LOGIC_VECTOR (6 downto 0);
    signal workgroup_size_minus_1_q : STD_LOGIC_VECTOR (6 downto 0);

begin


    -- not_stall_in(LOGICAL,22)
    not_stall_in_q <= not (in_i_stall);

    -- is_merge_data_to_local_regs_valid(MUX,17)
    is_merge_data_to_local_regs_valid_s <= merge_block_selector_q;
    is_merge_data_to_local_regs_valid_combproc: PROCESS (is_merge_data_to_local_regs_valid_s, in_valid_in_0, in_valid_in_1)
    BEGIN
        CASE (is_merge_data_to_local_regs_valid_s) IS
            WHEN "0" => is_merge_data_to_local_regs_valid_q <= in_valid_in_0;
            WHEN "1" => is_merge_data_to_local_regs_valid_q <= in_valid_in_1;
            WHEN OTHERS => is_merge_data_to_local_regs_valid_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- enable_regs(LOGICAL,11)
    enable_regs_q <= is_merge_data_to_local_regs_valid_q and not_stall_in_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- not_merge_block_selector(LOGICAL,21)
    not_merge_block_selector_q <= not (merge_block_selector_q);

    -- trunc_wgs(ROUND,27)
    trunc_wgs_in <= in_workgroup_size(6 downto 0);
    trunc_wgs_q <= trunc_wgs_in(6 downto 0);

    -- wg_limit(SUB,28)
    wg_limit_a <= STD_LOGIC_VECTOR("0" & trunc_wgs_q);
    wg_limit_b <= STD_LOGIC_VECTOR("0000000" & VCC_q);
    wg_limit_o <= STD_LOGIC_VECTOR(UNSIGNED(wg_limit_a) - UNSIGNED(wg_limit_b));
    wg_limit_q <= wg_limit_o(7 downto 0);

    -- trunc_sub(ROUND,26)
    trunc_sub_in <= STD_LOGIC_VECTOR(wg_limit_q(6 downto 0));
    trunc_sub_q <= trunc_sub_in(6 downto 0);

    -- workgroup_size_minus_1(REG,30)
    workgroup_size_minus_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            workgroup_size_minus_1_q <= "0000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            workgroup_size_minus_1_q <= trunc_sub_q;
        END IF;
    END PROCESS;

    -- const_wide_0(CONSTANT,9)
    const_wide_0_q <= "0000000";

    -- incrementor(ADD,12)
    incrementor_a <= STD_LOGIC_VECTOR("0" & workgroup_counter_q);
    incrementor_b <= STD_LOGIC_VECTOR("0000000" & VCC_q);
    incrementor_o <= STD_LOGIC_VECTOR(UNSIGNED(incrementor_a) + UNSIGNED(incrementor_b));
    incrementor_q <= incrementor_o(7 downto 0);

    -- trunc_add(ROUND,25)
    trunc_add_in <= incrementor_q(6 downto 0);
    trunc_add_q <= trunc_add_in(6 downto 0);

    -- counter_mux(MUX,10)
    counter_mux_s <= is_wg_through_q;
    counter_mux_combproc: PROCESS (counter_mux_s, trunc_add_q, const_wide_0_q)
    BEGIN
        CASE (counter_mux_s) IS
            WHEN "0" => counter_mux_q <= trunc_add_q;
            WHEN "1" => counter_mux_q <= const_wide_0_q;
            WHEN OTHERS => counter_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- workgroup_counter(REG,29)
    workgroup_counter_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            workgroup_counter_q <= "0000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (enable_regs_q = "1") THEN
                workgroup_counter_q <= counter_mux_q;
            END IF;
        END IF;
    END PROCESS;

    -- is_wg_through(LOGICAL,18)
    is_wg_through_q <= "1" WHEN workgroup_counter_q = workgroup_size_minus_1_q ELSE "0";

    -- choose_0_mux(MUX,3)
    choose_0_mux_s <= is_wg_through_q;
    choose_0_mux_combproc: PROCESS (choose_0_mux_s, not_merge_block_selector_q, GND_q)
    BEGIN
        CASE (choose_0_mux_s) IS
            WHEN "0" => choose_0_mux_q <= not_merge_block_selector_q;
            WHEN "1" => choose_0_mux_q <= GND_q;
            WHEN OTHERS => choose_0_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- choose_0(REG,2)
    choose_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            choose_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (enable_regs_q = "1") THEN
                choose_0_q <= choose_0_mux_q;
            END IF;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_choose_0(LOGICAL,20)
    not_choose_0_q <= not (choose_0_q);

    -- choose_based_on_valids(LOGICAL,6)
    choose_based_on_valids_q <= not_choose_0_q and in_valid_in_1;

    -- choose_1_mux(MUX,5)
    choose_1_mux_s <= is_wg_through_q;
    choose_1_mux_combproc: PROCESS (choose_1_mux_s, merge_block_selector_q, GND_q)
    BEGIN
        CASE (choose_1_mux_s) IS
            WHEN "0" => choose_1_mux_q <= merge_block_selector_q;
            WHEN "1" => choose_1_mux_q <= GND_q;
            WHEN OTHERS => choose_1_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- choose_1(REG,4)
    choose_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            choose_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (enable_regs_q = "1") THEN
                choose_1_q <= choose_1_mux_q;
            END IF;
        END IF;
    END PROCESS;

    -- merge_block_selector(LOGICAL,19)
    merge_block_selector_q <= choose_1_q or choose_based_on_valids_q;

    -- out_o_select(GPOUT,23)
    out_o_select <= merge_block_selector_q;

    -- out_o_valid(GPOUT,24)
    out_o_valid <= is_merge_data_to_local_regs_valid_q;

END normal;
