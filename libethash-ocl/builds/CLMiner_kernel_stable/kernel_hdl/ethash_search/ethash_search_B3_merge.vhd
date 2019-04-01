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

-- VHDL created from ethash_search_B3_merge
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

entity ethash_search_B3_merge is
    port (
        in_c0_exe1106_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1106_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2108_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe2108_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3112_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3112_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4116_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4116_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_encoder_ethash_search_B3_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_fpgaindvars_iv12_0 : in std_logic_vector(3 downto 0);  -- ufix4
        in_fpgaindvars_iv12_1 : in std_logic_vector(3 downto 0);  -- ufix4
        in_global_id_0195_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0195_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr9_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr9_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100165_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100165_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100375_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100375_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100585_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100585_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100795_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100795_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099325_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099325_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099535_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099535_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099745_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099745_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099955_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099955_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100060_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100060_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100270_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100270_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100480_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100480_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100690_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100690_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008100_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008100_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199430_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199430_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199640_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199640_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199850_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199850_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_0_0_cast120_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_0_0_cast120_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast123_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast123_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast126_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast126_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast129_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast129_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast132_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast132_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1106 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2108 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3112 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4116 : out std_logic_vector(63 downto 0);  -- ufix64
        out_fpgaindvars_iv12 : out std_logic_vector(3 downto 0);  -- ufix4
        out_global_id_0195 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i18_0908 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100165 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100375 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100585 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100795 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01173 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01175 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01177 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099325 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099535 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099745 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099955 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100060 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100270 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100480 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100690 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11008100 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11174 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11176 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11178 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11180 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199430 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199640 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199850 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast120 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast123 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast126 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast129 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast132 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B3_merge;

architecture normal of ethash_search_B3_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component dupName_0_priority_encoder_26ui0676j636g6u0qc0xajz is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_select : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1106_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1106_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2108_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2108_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe3112_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe3112_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe4116_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe4116_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal fpgaindvars_iv12_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv12_mux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal global_id_0195_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_0195_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i18_0908_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i18_0908_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_06_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_06_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr9_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_0_addr9_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_select_q : STD_LOGIC_VECTOR (0 downto 0);
    signal priority_encoder_out_o_select : STD_LOGIC_VECTOR (0 downto 0);
    signal priority_encoder_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100165_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100165_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100375_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100375_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100585_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100585_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100795_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100795_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01173_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01173_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01175_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01175_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01177_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01177_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01179_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01179_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099325_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_099325_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099535_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_099535_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099745_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_099745_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099955_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_099955_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100060_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100060_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100270_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100270_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100480_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100480_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100690_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100690_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11008100_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11008100_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11174_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11174_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11176_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11176_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11178_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11178_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11180_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11180_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199430_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_199430_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199640_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_199640_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199850_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_199850_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_0_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal state_0_0_cast120_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_0_0_cast120_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_4_0_cast123_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_4_0_cast123_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_5_0_cast126_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_5_0_cast126_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_6_0_cast129_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_6_0_cast129_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_7_0_cast132_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_7_0_cast132_mux_q : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- priority_encoder(BLACKBOX,133)
    thepriority_encoder : dupName_0_priority_encoder_26ui0676j636g6u0qc0xajz
    PORT MAP (
        in_i_stall => in_stall_in,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        in_workgroup_size => in_encoder_ethash_search_B3_merge_priority_encoder_workgroup_size,
        out_o_select => priority_encoder_out_o_select,
        out_o_valid => priority_encoder_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c0_exe1106_mux(MUX,2)
    c0_exe1106_mux_s <= priority_encoder_out_o_select;
    c0_exe1106_mux_combproc: PROCESS (c0_exe1106_mux_s, in_c0_exe1106_0, in_c0_exe1106_1)
    BEGIN
        CASE (c0_exe1106_mux_s) IS
            WHEN "0" => c0_exe1106_mux_q <= in_c0_exe1106_0;
            WHEN "1" => c0_exe1106_mux_q <= in_c0_exe1106_1;
            WHEN OTHERS => c0_exe1106_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1106(GPOUT,92)
    out_c0_exe1106 <= c0_exe1106_mux_q;

    -- c0_exe2108_mux(MUX,3)
    c0_exe2108_mux_s <= priority_encoder_out_o_select;
    c0_exe2108_mux_combproc: PROCESS (c0_exe2108_mux_s, in_c0_exe2108_0, in_c0_exe2108_1)
    BEGIN
        CASE (c0_exe2108_mux_s) IS
            WHEN "0" => c0_exe2108_mux_q <= in_c0_exe2108_0;
            WHEN "1" => c0_exe2108_mux_q <= in_c0_exe2108_1;
            WHEN OTHERS => c0_exe2108_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe2108(GPOUT,93)
    out_c0_exe2108 <= c0_exe2108_mux_q;

    -- c0_exe3112_mux(MUX,4)
    c0_exe3112_mux_s <= priority_encoder_out_o_select;
    c0_exe3112_mux_combproc: PROCESS (c0_exe3112_mux_s, in_c0_exe3112_0, in_c0_exe3112_1)
    BEGIN
        CASE (c0_exe3112_mux_s) IS
            WHEN "0" => c0_exe3112_mux_q <= in_c0_exe3112_0;
            WHEN "1" => c0_exe3112_mux_q <= in_c0_exe3112_1;
            WHEN OTHERS => c0_exe3112_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe3112(GPOUT,94)
    out_c0_exe3112 <= c0_exe3112_mux_q;

    -- c0_exe4116_mux(MUX,5)
    c0_exe4116_mux_s <= priority_encoder_out_o_select;
    c0_exe4116_mux_combproc: PROCESS (c0_exe4116_mux_s, in_c0_exe4116_0, in_c0_exe4116_1)
    BEGIN
        CASE (c0_exe4116_mux_s) IS
            WHEN "0" => c0_exe4116_mux_q <= in_c0_exe4116_0;
            WHEN "1" => c0_exe4116_mux_q <= in_c0_exe4116_1;
            WHEN OTHERS => c0_exe4116_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe4116(GPOUT,95)
    out_c0_exe4116 <= c0_exe4116_mux_q;

    -- fpgaindvars_iv12_mux(MUX,6)
    fpgaindvars_iv12_mux_s <= priority_encoder_out_o_select;
    fpgaindvars_iv12_mux_combproc: PROCESS (fpgaindvars_iv12_mux_s, in_fpgaindvars_iv12_0, in_fpgaindvars_iv12_1)
    BEGIN
        CASE (fpgaindvars_iv12_mux_s) IS
            WHEN "0" => fpgaindvars_iv12_mux_q <= in_fpgaindvars_iv12_0;
            WHEN "1" => fpgaindvars_iv12_mux_q <= in_fpgaindvars_iv12_1;
            WHEN OTHERS => fpgaindvars_iv12_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv12(GPOUT,96)
    out_fpgaindvars_iv12 <= fpgaindvars_iv12_mux_q;

    -- global_id_0195_mux(MUX,7)
    global_id_0195_mux_s <= priority_encoder_out_o_select;
    global_id_0195_mux_combproc: PROCESS (global_id_0195_mux_s, in_global_id_0195_0, in_global_id_0195_1)
    BEGIN
        CASE (global_id_0195_mux_s) IS
            WHEN "0" => global_id_0195_mux_q <= in_global_id_0195_0;
            WHEN "1" => global_id_0195_mux_q <= in_global_id_0195_1;
            WHEN OTHERS => global_id_0195_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_global_id_0195(GPOUT,97)
    out_global_id_0195 <= global_id_0195_mux_q;

    -- i18_0908_mux(MUX,8)
    i18_0908_mux_s <= priority_encoder_out_o_select;
    i18_0908_mux_combproc: PROCESS (i18_0908_mux_s, in_i18_0908_0, in_i18_0908_1)
    BEGIN
        CASE (i18_0908_mux_s) IS
            WHEN "0" => i18_0908_mux_q <= in_i18_0908_0;
            WHEN "1" => i18_0908_mux_q <= in_i18_0908_1;
            WHEN OTHERS => i18_0908_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i18_0908(GPOUT,98)
    out_i18_0908 <= i18_0908_mux_q;

    -- l_grpid_06_mux(MUX,89)
    l_grpid_06_mux_s <= priority_encoder_out_o_select;
    l_grpid_06_mux_combproc: PROCESS (l_grpid_06_mux_s, in_l_grpid_06_0, in_l_grpid_06_1)
    BEGIN
        CASE (l_grpid_06_mux_s) IS
            WHEN "0" => l_grpid_06_mux_q <= in_l_grpid_06_0;
            WHEN "1" => l_grpid_06_mux_q <= in_l_grpid_06_1;
            WHEN OTHERS => l_grpid_06_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_06(GPOUT,99)
    out_l_grpid_06 <= l_grpid_06_mux_q;

    -- l_grpid_0_addr9_mux(MUX,90)
    l_grpid_0_addr9_mux_s <= priority_encoder_out_o_select;
    l_grpid_0_addr9_mux_combproc: PROCESS (l_grpid_0_addr9_mux_s, in_l_grpid_0_addr9_0, in_l_grpid_0_addr9_1)
    BEGIN
        CASE (l_grpid_0_addr9_mux_s) IS
            WHEN "0" => l_grpid_0_addr9_mux_q <= in_l_grpid_0_addr9_0;
            WHEN "1" => l_grpid_0_addr9_mux_q <= in_l_grpid_0_addr9_1;
            WHEN OTHERS => l_grpid_0_addr9_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_0_addr9(GPOUT,100)
    out_l_grpid_0_addr9 <= l_grpid_0_addr9_mux_q;

    -- scalarizer_0100165_mux(MUX,134)
    scalarizer_0100165_mux_s <= priority_encoder_out_o_select;
    scalarizer_0100165_mux_combproc: PROCESS (scalarizer_0100165_mux_s, in_scalarizer_0100165_0, in_scalarizer_0100165_1)
    BEGIN
        CASE (scalarizer_0100165_mux_s) IS
            WHEN "0" => scalarizer_0100165_mux_q <= in_scalarizer_0100165_0;
            WHEN "1" => scalarizer_0100165_mux_q <= in_scalarizer_0100165_1;
            WHEN OTHERS => scalarizer_0100165_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0100165(GPOUT,101)
    out_scalarizer_0100165 <= scalarizer_0100165_mux_q;

    -- scalarizer_0100375_mux(MUX,135)
    scalarizer_0100375_mux_s <= priority_encoder_out_o_select;
    scalarizer_0100375_mux_combproc: PROCESS (scalarizer_0100375_mux_s, in_scalarizer_0100375_0, in_scalarizer_0100375_1)
    BEGIN
        CASE (scalarizer_0100375_mux_s) IS
            WHEN "0" => scalarizer_0100375_mux_q <= in_scalarizer_0100375_0;
            WHEN "1" => scalarizer_0100375_mux_q <= in_scalarizer_0100375_1;
            WHEN OTHERS => scalarizer_0100375_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0100375(GPOUT,102)
    out_scalarizer_0100375 <= scalarizer_0100375_mux_q;

    -- scalarizer_0100585_mux(MUX,136)
    scalarizer_0100585_mux_s <= priority_encoder_out_o_select;
    scalarizer_0100585_mux_combproc: PROCESS (scalarizer_0100585_mux_s, in_scalarizer_0100585_0, in_scalarizer_0100585_1)
    BEGIN
        CASE (scalarizer_0100585_mux_s) IS
            WHEN "0" => scalarizer_0100585_mux_q <= in_scalarizer_0100585_0;
            WHEN "1" => scalarizer_0100585_mux_q <= in_scalarizer_0100585_1;
            WHEN OTHERS => scalarizer_0100585_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0100585(GPOUT,103)
    out_scalarizer_0100585 <= scalarizer_0100585_mux_q;

    -- scalarizer_0100795_mux(MUX,137)
    scalarizer_0100795_mux_s <= priority_encoder_out_o_select;
    scalarizer_0100795_mux_combproc: PROCESS (scalarizer_0100795_mux_s, in_scalarizer_0100795_0, in_scalarizer_0100795_1)
    BEGIN
        CASE (scalarizer_0100795_mux_s) IS
            WHEN "0" => scalarizer_0100795_mux_q <= in_scalarizer_0100795_0;
            WHEN "1" => scalarizer_0100795_mux_q <= in_scalarizer_0100795_1;
            WHEN OTHERS => scalarizer_0100795_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0100795(GPOUT,104)
    out_scalarizer_0100795 <= scalarizer_0100795_mux_q;

    -- scalarizer_01173_mux(MUX,138)
    scalarizer_01173_mux_s <= priority_encoder_out_o_select;
    scalarizer_01173_mux_combproc: PROCESS (scalarizer_01173_mux_s, in_scalarizer_01173_0, in_scalarizer_01173_1)
    BEGIN
        CASE (scalarizer_01173_mux_s) IS
            WHEN "0" => scalarizer_01173_mux_q <= in_scalarizer_01173_0;
            WHEN "1" => scalarizer_01173_mux_q <= in_scalarizer_01173_1;
            WHEN OTHERS => scalarizer_01173_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01173(GPOUT,105)
    out_scalarizer_01173 <= scalarizer_01173_mux_q;

    -- scalarizer_01175_mux(MUX,139)
    scalarizer_01175_mux_s <= priority_encoder_out_o_select;
    scalarizer_01175_mux_combproc: PROCESS (scalarizer_01175_mux_s, in_scalarizer_01175_0, in_scalarizer_01175_1)
    BEGIN
        CASE (scalarizer_01175_mux_s) IS
            WHEN "0" => scalarizer_01175_mux_q <= in_scalarizer_01175_0;
            WHEN "1" => scalarizer_01175_mux_q <= in_scalarizer_01175_1;
            WHEN OTHERS => scalarizer_01175_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01175(GPOUT,106)
    out_scalarizer_01175 <= scalarizer_01175_mux_q;

    -- scalarizer_01177_mux(MUX,140)
    scalarizer_01177_mux_s <= priority_encoder_out_o_select;
    scalarizer_01177_mux_combproc: PROCESS (scalarizer_01177_mux_s, in_scalarizer_01177_0, in_scalarizer_01177_1)
    BEGIN
        CASE (scalarizer_01177_mux_s) IS
            WHEN "0" => scalarizer_01177_mux_q <= in_scalarizer_01177_0;
            WHEN "1" => scalarizer_01177_mux_q <= in_scalarizer_01177_1;
            WHEN OTHERS => scalarizer_01177_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01177(GPOUT,107)
    out_scalarizer_01177 <= scalarizer_01177_mux_q;

    -- scalarizer_01179_mux(MUX,141)
    scalarizer_01179_mux_s <= priority_encoder_out_o_select;
    scalarizer_01179_mux_combproc: PROCESS (scalarizer_01179_mux_s, in_scalarizer_01179_0, in_scalarizer_01179_1)
    BEGIN
        CASE (scalarizer_01179_mux_s) IS
            WHEN "0" => scalarizer_01179_mux_q <= in_scalarizer_01179_0;
            WHEN "1" => scalarizer_01179_mux_q <= in_scalarizer_01179_1;
            WHEN OTHERS => scalarizer_01179_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01179(GPOUT,108)
    out_scalarizer_01179 <= scalarizer_01179_mux_q;

    -- scalarizer_099325_mux(MUX,142)
    scalarizer_099325_mux_s <= priority_encoder_out_o_select;
    scalarizer_099325_mux_combproc: PROCESS (scalarizer_099325_mux_s, in_scalarizer_099325_0, in_scalarizer_099325_1)
    BEGIN
        CASE (scalarizer_099325_mux_s) IS
            WHEN "0" => scalarizer_099325_mux_q <= in_scalarizer_099325_0;
            WHEN "1" => scalarizer_099325_mux_q <= in_scalarizer_099325_1;
            WHEN OTHERS => scalarizer_099325_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_099325(GPOUT,109)
    out_scalarizer_099325 <= scalarizer_099325_mux_q;

    -- scalarizer_099535_mux(MUX,143)
    scalarizer_099535_mux_s <= priority_encoder_out_o_select;
    scalarizer_099535_mux_combproc: PROCESS (scalarizer_099535_mux_s, in_scalarizer_099535_0, in_scalarizer_099535_1)
    BEGIN
        CASE (scalarizer_099535_mux_s) IS
            WHEN "0" => scalarizer_099535_mux_q <= in_scalarizer_099535_0;
            WHEN "1" => scalarizer_099535_mux_q <= in_scalarizer_099535_1;
            WHEN OTHERS => scalarizer_099535_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_099535(GPOUT,110)
    out_scalarizer_099535 <= scalarizer_099535_mux_q;

    -- scalarizer_099745_mux(MUX,144)
    scalarizer_099745_mux_s <= priority_encoder_out_o_select;
    scalarizer_099745_mux_combproc: PROCESS (scalarizer_099745_mux_s, in_scalarizer_099745_0, in_scalarizer_099745_1)
    BEGIN
        CASE (scalarizer_099745_mux_s) IS
            WHEN "0" => scalarizer_099745_mux_q <= in_scalarizer_099745_0;
            WHEN "1" => scalarizer_099745_mux_q <= in_scalarizer_099745_1;
            WHEN OTHERS => scalarizer_099745_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_099745(GPOUT,111)
    out_scalarizer_099745 <= scalarizer_099745_mux_q;

    -- scalarizer_099955_mux(MUX,145)
    scalarizer_099955_mux_s <= priority_encoder_out_o_select;
    scalarizer_099955_mux_combproc: PROCESS (scalarizer_099955_mux_s, in_scalarizer_099955_0, in_scalarizer_099955_1)
    BEGIN
        CASE (scalarizer_099955_mux_s) IS
            WHEN "0" => scalarizer_099955_mux_q <= in_scalarizer_099955_0;
            WHEN "1" => scalarizer_099955_mux_q <= in_scalarizer_099955_1;
            WHEN OTHERS => scalarizer_099955_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_099955(GPOUT,112)
    out_scalarizer_099955 <= scalarizer_099955_mux_q;

    -- scalarizer_1100060_mux(MUX,146)
    scalarizer_1100060_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100060_mux_combproc: PROCESS (scalarizer_1100060_mux_s, in_scalarizer_1100060_0, in_scalarizer_1100060_1)
    BEGIN
        CASE (scalarizer_1100060_mux_s) IS
            WHEN "0" => scalarizer_1100060_mux_q <= in_scalarizer_1100060_0;
            WHEN "1" => scalarizer_1100060_mux_q <= in_scalarizer_1100060_1;
            WHEN OTHERS => scalarizer_1100060_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100060(GPOUT,113)
    out_scalarizer_1100060 <= scalarizer_1100060_mux_q;

    -- scalarizer_1100270_mux(MUX,147)
    scalarizer_1100270_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100270_mux_combproc: PROCESS (scalarizer_1100270_mux_s, in_scalarizer_1100270_0, in_scalarizer_1100270_1)
    BEGIN
        CASE (scalarizer_1100270_mux_s) IS
            WHEN "0" => scalarizer_1100270_mux_q <= in_scalarizer_1100270_0;
            WHEN "1" => scalarizer_1100270_mux_q <= in_scalarizer_1100270_1;
            WHEN OTHERS => scalarizer_1100270_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100270(GPOUT,114)
    out_scalarizer_1100270 <= scalarizer_1100270_mux_q;

    -- scalarizer_1100480_mux(MUX,148)
    scalarizer_1100480_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100480_mux_combproc: PROCESS (scalarizer_1100480_mux_s, in_scalarizer_1100480_0, in_scalarizer_1100480_1)
    BEGIN
        CASE (scalarizer_1100480_mux_s) IS
            WHEN "0" => scalarizer_1100480_mux_q <= in_scalarizer_1100480_0;
            WHEN "1" => scalarizer_1100480_mux_q <= in_scalarizer_1100480_1;
            WHEN OTHERS => scalarizer_1100480_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100480(GPOUT,115)
    out_scalarizer_1100480 <= scalarizer_1100480_mux_q;

    -- scalarizer_1100690_mux(MUX,149)
    scalarizer_1100690_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100690_mux_combproc: PROCESS (scalarizer_1100690_mux_s, in_scalarizer_1100690_0, in_scalarizer_1100690_1)
    BEGIN
        CASE (scalarizer_1100690_mux_s) IS
            WHEN "0" => scalarizer_1100690_mux_q <= in_scalarizer_1100690_0;
            WHEN "1" => scalarizer_1100690_mux_q <= in_scalarizer_1100690_1;
            WHEN OTHERS => scalarizer_1100690_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100690(GPOUT,116)
    out_scalarizer_1100690 <= scalarizer_1100690_mux_q;

    -- scalarizer_11008100_mux(MUX,150)
    scalarizer_11008100_mux_s <= priority_encoder_out_o_select;
    scalarizer_11008100_mux_combproc: PROCESS (scalarizer_11008100_mux_s, in_scalarizer_11008100_0, in_scalarizer_11008100_1)
    BEGIN
        CASE (scalarizer_11008100_mux_s) IS
            WHEN "0" => scalarizer_11008100_mux_q <= in_scalarizer_11008100_0;
            WHEN "1" => scalarizer_11008100_mux_q <= in_scalarizer_11008100_1;
            WHEN OTHERS => scalarizer_11008100_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11008100(GPOUT,117)
    out_scalarizer_11008100 <= scalarizer_11008100_mux_q;

    -- scalarizer_11174_mux(MUX,151)
    scalarizer_11174_mux_s <= priority_encoder_out_o_select;
    scalarizer_11174_mux_combproc: PROCESS (scalarizer_11174_mux_s, in_scalarizer_11174_0, in_scalarizer_11174_1)
    BEGIN
        CASE (scalarizer_11174_mux_s) IS
            WHEN "0" => scalarizer_11174_mux_q <= in_scalarizer_11174_0;
            WHEN "1" => scalarizer_11174_mux_q <= in_scalarizer_11174_1;
            WHEN OTHERS => scalarizer_11174_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11174(GPOUT,118)
    out_scalarizer_11174 <= scalarizer_11174_mux_q;

    -- scalarizer_11176_mux(MUX,152)
    scalarizer_11176_mux_s <= priority_encoder_out_o_select;
    scalarizer_11176_mux_combproc: PROCESS (scalarizer_11176_mux_s, in_scalarizer_11176_0, in_scalarizer_11176_1)
    BEGIN
        CASE (scalarizer_11176_mux_s) IS
            WHEN "0" => scalarizer_11176_mux_q <= in_scalarizer_11176_0;
            WHEN "1" => scalarizer_11176_mux_q <= in_scalarizer_11176_1;
            WHEN OTHERS => scalarizer_11176_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11176(GPOUT,119)
    out_scalarizer_11176 <= scalarizer_11176_mux_q;

    -- scalarizer_11178_mux(MUX,153)
    scalarizer_11178_mux_s <= priority_encoder_out_o_select;
    scalarizer_11178_mux_combproc: PROCESS (scalarizer_11178_mux_s, in_scalarizer_11178_0, in_scalarizer_11178_1)
    BEGIN
        CASE (scalarizer_11178_mux_s) IS
            WHEN "0" => scalarizer_11178_mux_q <= in_scalarizer_11178_0;
            WHEN "1" => scalarizer_11178_mux_q <= in_scalarizer_11178_1;
            WHEN OTHERS => scalarizer_11178_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11178(GPOUT,120)
    out_scalarizer_11178 <= scalarizer_11178_mux_q;

    -- scalarizer_11180_mux(MUX,154)
    scalarizer_11180_mux_s <= priority_encoder_out_o_select;
    scalarizer_11180_mux_combproc: PROCESS (scalarizer_11180_mux_s, in_scalarizer_11180_0, in_scalarizer_11180_1)
    BEGIN
        CASE (scalarizer_11180_mux_s) IS
            WHEN "0" => scalarizer_11180_mux_q <= in_scalarizer_11180_0;
            WHEN "1" => scalarizer_11180_mux_q <= in_scalarizer_11180_1;
            WHEN OTHERS => scalarizer_11180_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11180(GPOUT,121)
    out_scalarizer_11180 <= scalarizer_11180_mux_q;

    -- scalarizer_199430_mux(MUX,155)
    scalarizer_199430_mux_s <= priority_encoder_out_o_select;
    scalarizer_199430_mux_combproc: PROCESS (scalarizer_199430_mux_s, in_scalarizer_199430_0, in_scalarizer_199430_1)
    BEGIN
        CASE (scalarizer_199430_mux_s) IS
            WHEN "0" => scalarizer_199430_mux_q <= in_scalarizer_199430_0;
            WHEN "1" => scalarizer_199430_mux_q <= in_scalarizer_199430_1;
            WHEN OTHERS => scalarizer_199430_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_199430(GPOUT,122)
    out_scalarizer_199430 <= scalarizer_199430_mux_q;

    -- scalarizer_199640_mux(MUX,156)
    scalarizer_199640_mux_s <= priority_encoder_out_o_select;
    scalarizer_199640_mux_combproc: PROCESS (scalarizer_199640_mux_s, in_scalarizer_199640_0, in_scalarizer_199640_1)
    BEGIN
        CASE (scalarizer_199640_mux_s) IS
            WHEN "0" => scalarizer_199640_mux_q <= in_scalarizer_199640_0;
            WHEN "1" => scalarizer_199640_mux_q <= in_scalarizer_199640_1;
            WHEN OTHERS => scalarizer_199640_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_199640(GPOUT,123)
    out_scalarizer_199640 <= scalarizer_199640_mux_q;

    -- scalarizer_199850_mux(MUX,157)
    scalarizer_199850_mux_s <= priority_encoder_out_o_select;
    scalarizer_199850_mux_combproc: PROCESS (scalarizer_199850_mux_s, in_scalarizer_199850_0, in_scalarizer_199850_1)
    BEGIN
        CASE (scalarizer_199850_mux_s) IS
            WHEN "0" => scalarizer_199850_mux_q <= in_scalarizer_199850_0;
            WHEN "1" => scalarizer_199850_mux_q <= in_scalarizer_199850_1;
            WHEN OTHERS => scalarizer_199850_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_199850(GPOUT,124)
    out_scalarizer_199850 <= scalarizer_199850_mux_q;

    -- stall_out_0_specific(LOGICAL,158)
    stall_out_0_specific_q <= in_stall_in or priority_encoder_out_o_select;

    -- out_stall_out_0(GPOUT,125)
    out_stall_out_0 <= stall_out_0_specific_q;

    -- not_select(LOGICAL,91)
    not_select_q <= not (priority_encoder_out_o_select);

    -- stall_out_1_specific(LOGICAL,159)
    stall_out_1_specific_q <= in_stall_in or not_select_q;

    -- out_stall_out_1(GPOUT,126)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- state_0_0_cast120_mux(MUX,160)
    state_0_0_cast120_mux_s <= priority_encoder_out_o_select;
    state_0_0_cast120_mux_combproc: PROCESS (state_0_0_cast120_mux_s, in_state_0_0_cast120_0, in_state_0_0_cast120_1)
    BEGIN
        CASE (state_0_0_cast120_mux_s) IS
            WHEN "0" => state_0_0_cast120_mux_q <= in_state_0_0_cast120_0;
            WHEN "1" => state_0_0_cast120_mux_q <= in_state_0_0_cast120_1;
            WHEN OTHERS => state_0_0_cast120_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_0_0_cast120(GPOUT,127)
    out_state_0_0_cast120 <= state_0_0_cast120_mux_q;

    -- state_4_0_cast123_mux(MUX,161)
    state_4_0_cast123_mux_s <= priority_encoder_out_o_select;
    state_4_0_cast123_mux_combproc: PROCESS (state_4_0_cast123_mux_s, in_state_4_0_cast123_0, in_state_4_0_cast123_1)
    BEGIN
        CASE (state_4_0_cast123_mux_s) IS
            WHEN "0" => state_4_0_cast123_mux_q <= in_state_4_0_cast123_0;
            WHEN "1" => state_4_0_cast123_mux_q <= in_state_4_0_cast123_1;
            WHEN OTHERS => state_4_0_cast123_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_4_0_cast123(GPOUT,128)
    out_state_4_0_cast123 <= state_4_0_cast123_mux_q;

    -- state_5_0_cast126_mux(MUX,162)
    state_5_0_cast126_mux_s <= priority_encoder_out_o_select;
    state_5_0_cast126_mux_combproc: PROCESS (state_5_0_cast126_mux_s, in_state_5_0_cast126_0, in_state_5_0_cast126_1)
    BEGIN
        CASE (state_5_0_cast126_mux_s) IS
            WHEN "0" => state_5_0_cast126_mux_q <= in_state_5_0_cast126_0;
            WHEN "1" => state_5_0_cast126_mux_q <= in_state_5_0_cast126_1;
            WHEN OTHERS => state_5_0_cast126_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_5_0_cast126(GPOUT,129)
    out_state_5_0_cast126 <= state_5_0_cast126_mux_q;

    -- state_6_0_cast129_mux(MUX,163)
    state_6_0_cast129_mux_s <= priority_encoder_out_o_select;
    state_6_0_cast129_mux_combproc: PROCESS (state_6_0_cast129_mux_s, in_state_6_0_cast129_0, in_state_6_0_cast129_1)
    BEGIN
        CASE (state_6_0_cast129_mux_s) IS
            WHEN "0" => state_6_0_cast129_mux_q <= in_state_6_0_cast129_0;
            WHEN "1" => state_6_0_cast129_mux_q <= in_state_6_0_cast129_1;
            WHEN OTHERS => state_6_0_cast129_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_6_0_cast129(GPOUT,130)
    out_state_6_0_cast129 <= state_6_0_cast129_mux_q;

    -- state_7_0_cast132_mux(MUX,164)
    state_7_0_cast132_mux_s <= priority_encoder_out_o_select;
    state_7_0_cast132_mux_combproc: PROCESS (state_7_0_cast132_mux_s, in_state_7_0_cast132_0, in_state_7_0_cast132_1)
    BEGIN
        CASE (state_7_0_cast132_mux_s) IS
            WHEN "0" => state_7_0_cast132_mux_q <= in_state_7_0_cast132_0;
            WHEN "1" => state_7_0_cast132_mux_q <= in_state_7_0_cast132_1;
            WHEN OTHERS => state_7_0_cast132_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_7_0_cast132(GPOUT,131)
    out_state_7_0_cast132 <= state_7_0_cast132_mux_q;

    -- out_valid_out(GPOUT,132)
    out_valid_out <= priority_encoder_out_o_valid;

END normal;
