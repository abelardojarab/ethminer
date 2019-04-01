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

-- VHDL created from bb_ethash_calculate_dag_item_B6_sr_0
-- VHDL created on Mon Apr  1 13:52:59 2019


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

entity bb_ethash_calculate_dag_item_B6_sr_0 is
    port (
        in_i_data_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_2 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_i_data_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_4 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_i_data_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_6 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_i_data_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_51 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_52 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_53 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_54 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_2 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_o_data_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_4 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_o_data_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_6 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_o_data_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_51 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_52 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_53 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_54 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B6_sr_0;

architecture normal of bb_ethash_calculate_dag_item_B6_sr_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_0_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_1_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_2_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_2_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal data_mux_3_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_3_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_4_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_4_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal data_mux_5_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_5_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_6_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_6_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal data_mux_7_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_7_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_8_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_8_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_9_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_9_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_10_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_10_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_11_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_12_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_12_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_13_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_13_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_14_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_14_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_15_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_15_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_16_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_16_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_17_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_17_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_18_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_18_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_19_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_19_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_20_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_20_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_21_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_21_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_22_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_22_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_23_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_23_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_24_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_24_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_25_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_25_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_26_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_26_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_27_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_27_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_28_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_28_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_29_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_29_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_30_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_30_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_31_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_31_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_32_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_32_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_33_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_33_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_34_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_34_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_35_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_35_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_36_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_36_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_37_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_37_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_38_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_38_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_39_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_39_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_40_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_40_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_41_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_41_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_42_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_42_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_43_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_43_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_44_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_44_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_45_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_45_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_46_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_46_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_47_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_47_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_48_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_48_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_49_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_49_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_50_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_50_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_51_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_51_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_52_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_52_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_53_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_53_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_54_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_54_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_2_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal sr_3_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_4_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal sr_5_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_6_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal sr_7_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_8_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_9_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_10_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_12_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_13_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_14_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_15_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_16_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_17_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_18_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_19_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_20_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_21_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_22_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_23_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_24_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_25_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_26_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_27_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_28_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_29_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_30_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_31_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_32_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_33_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_34_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_35_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_36_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_37_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_38_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_39_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_40_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_41_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_42_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_43_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_44_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_45_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_46_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_47_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_48_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_49_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_50_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_51_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_52_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_53_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_54_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal combined_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_sr_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_and_valid_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- not_sr_valid(LOGICAL,227)
    not_sr_valid_q <= not (sr_valid_q);

    -- sr_0_x(REG,171)
    sr_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_0_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_0_x_q <= in_i_data_0;
            END IF;
        END IF;
    END PROCESS;

    -- combined_valid(LOGICAL,226)
    combined_valid_q <= in_i_valid or sr_valid_q;

    -- stall_and_valid(LOGICAL,229)
    stall_and_valid_q <= in_i_stall and combined_valid_q;

    -- sr_valid(REG,228)
    sr_valid_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_valid_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            sr_valid_q <= stall_and_valid_q;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- data_mux_0_x(MUX,2)
    data_mux_0_x_s <= sr_valid_q;
    data_mux_0_x_combproc: PROCESS (data_mux_0_x_s, in_i_data_0, sr_0_x_q)
    BEGIN
        CASE (data_mux_0_x_s) IS
            WHEN "0" => data_mux_0_x_q <= in_i_data_0;
            WHEN "1" => data_mux_0_x_q <= sr_0_x_q;
            WHEN OTHERS => data_mux_0_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_0(GPOUT,114)
    out_o_data_0 <= data_mux_0_x_q;

    -- sr_1_x(REG,172)
    sr_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_1_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_1_x_q <= in_i_data_1;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_1_x(MUX,3)
    data_mux_1_x_s <= sr_valid_q;
    data_mux_1_x_combproc: PROCESS (data_mux_1_x_s, in_i_data_1, sr_1_x_q)
    BEGIN
        CASE (data_mux_1_x_s) IS
            WHEN "0" => data_mux_1_x_q <= in_i_data_1;
            WHEN "1" => data_mux_1_x_q <= sr_1_x_q;
            WHEN OTHERS => data_mux_1_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_1(GPOUT,115)
    out_o_data_1 <= data_mux_1_x_q;

    -- sr_2_x(REG,173)
    sr_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_2_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_2_x_q <= in_i_data_2;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_2_x(MUX,4)
    data_mux_2_x_s <= sr_valid_q;
    data_mux_2_x_combproc: PROCESS (data_mux_2_x_s, in_i_data_2, sr_2_x_q)
    BEGIN
        CASE (data_mux_2_x_s) IS
            WHEN "0" => data_mux_2_x_q <= in_i_data_2;
            WHEN "1" => data_mux_2_x_q <= sr_2_x_q;
            WHEN OTHERS => data_mux_2_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_2(GPOUT,116)
    out_o_data_2 <= data_mux_2_x_q;

    -- sr_3_x(REG,174)
    sr_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_3_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_3_x_q <= in_i_data_3;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_3_x(MUX,5)
    data_mux_3_x_s <= sr_valid_q;
    data_mux_3_x_combproc: PROCESS (data_mux_3_x_s, in_i_data_3, sr_3_x_q)
    BEGIN
        CASE (data_mux_3_x_s) IS
            WHEN "0" => data_mux_3_x_q <= in_i_data_3;
            WHEN "1" => data_mux_3_x_q <= sr_3_x_q;
            WHEN OTHERS => data_mux_3_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_3(GPOUT,117)
    out_o_data_3 <= data_mux_3_x_q;

    -- sr_4_x(REG,175)
    sr_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_4_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_4_x_q <= in_i_data_4;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_4_x(MUX,6)
    data_mux_4_x_s <= sr_valid_q;
    data_mux_4_x_combproc: PROCESS (data_mux_4_x_s, in_i_data_4, sr_4_x_q)
    BEGIN
        CASE (data_mux_4_x_s) IS
            WHEN "0" => data_mux_4_x_q <= in_i_data_4;
            WHEN "1" => data_mux_4_x_q <= sr_4_x_q;
            WHEN OTHERS => data_mux_4_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_4(GPOUT,118)
    out_o_data_4 <= data_mux_4_x_q;

    -- sr_5_x(REG,176)
    sr_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_5_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_5_x_q <= in_i_data_5;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_5_x(MUX,7)
    data_mux_5_x_s <= sr_valid_q;
    data_mux_5_x_combproc: PROCESS (data_mux_5_x_s, in_i_data_5, sr_5_x_q)
    BEGIN
        CASE (data_mux_5_x_s) IS
            WHEN "0" => data_mux_5_x_q <= in_i_data_5;
            WHEN "1" => data_mux_5_x_q <= sr_5_x_q;
            WHEN OTHERS => data_mux_5_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_5(GPOUT,119)
    out_o_data_5 <= data_mux_5_x_q;

    -- sr_6_x(REG,177)
    sr_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_6_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_6_x_q <= in_i_data_6;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_6_x(MUX,8)
    data_mux_6_x_s <= sr_valid_q;
    data_mux_6_x_combproc: PROCESS (data_mux_6_x_s, in_i_data_6, sr_6_x_q)
    BEGIN
        CASE (data_mux_6_x_s) IS
            WHEN "0" => data_mux_6_x_q <= in_i_data_6;
            WHEN "1" => data_mux_6_x_q <= sr_6_x_q;
            WHEN OTHERS => data_mux_6_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_6(GPOUT,120)
    out_o_data_6 <= data_mux_6_x_q;

    -- sr_7_x(REG,178)
    sr_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_7_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_7_x_q <= in_i_data_7;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_7_x(MUX,9)
    data_mux_7_x_s <= sr_valid_q;
    data_mux_7_x_combproc: PROCESS (data_mux_7_x_s, in_i_data_7, sr_7_x_q)
    BEGIN
        CASE (data_mux_7_x_s) IS
            WHEN "0" => data_mux_7_x_q <= in_i_data_7;
            WHEN "1" => data_mux_7_x_q <= sr_7_x_q;
            WHEN OTHERS => data_mux_7_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_7(GPOUT,121)
    out_o_data_7 <= data_mux_7_x_q;

    -- sr_8_x(REG,179)
    sr_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_8_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_8_x_q <= in_i_data_8;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_8_x(MUX,10)
    data_mux_8_x_s <= sr_valid_q;
    data_mux_8_x_combproc: PROCESS (data_mux_8_x_s, in_i_data_8, sr_8_x_q)
    BEGIN
        CASE (data_mux_8_x_s) IS
            WHEN "0" => data_mux_8_x_q <= in_i_data_8;
            WHEN "1" => data_mux_8_x_q <= sr_8_x_q;
            WHEN OTHERS => data_mux_8_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_8(GPOUT,122)
    out_o_data_8 <= data_mux_8_x_q;

    -- sr_9_x(REG,180)
    sr_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_9_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_9_x_q <= in_i_data_9;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_9_x(MUX,11)
    data_mux_9_x_s <= sr_valid_q;
    data_mux_9_x_combproc: PROCESS (data_mux_9_x_s, in_i_data_9, sr_9_x_q)
    BEGIN
        CASE (data_mux_9_x_s) IS
            WHEN "0" => data_mux_9_x_q <= in_i_data_9;
            WHEN "1" => data_mux_9_x_q <= sr_9_x_q;
            WHEN OTHERS => data_mux_9_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_9(GPOUT,123)
    out_o_data_9 <= data_mux_9_x_q;

    -- sr_10_x(REG,181)
    sr_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_10_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_10_x_q <= in_i_data_10;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_10_x(MUX,12)
    data_mux_10_x_s <= sr_valid_q;
    data_mux_10_x_combproc: PROCESS (data_mux_10_x_s, in_i_data_10, sr_10_x_q)
    BEGIN
        CASE (data_mux_10_x_s) IS
            WHEN "0" => data_mux_10_x_q <= in_i_data_10;
            WHEN "1" => data_mux_10_x_q <= sr_10_x_q;
            WHEN OTHERS => data_mux_10_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_10(GPOUT,124)
    out_o_data_10 <= data_mux_10_x_q;

    -- sr_11_x(REG,182)
    sr_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_11_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_11_x_q <= in_i_data_11;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_11_x(MUX,13)
    data_mux_11_x_s <= sr_valid_q;
    data_mux_11_x_combproc: PROCESS (data_mux_11_x_s, in_i_data_11, sr_11_x_q)
    BEGIN
        CASE (data_mux_11_x_s) IS
            WHEN "0" => data_mux_11_x_q <= in_i_data_11;
            WHEN "1" => data_mux_11_x_q <= sr_11_x_q;
            WHEN OTHERS => data_mux_11_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_11(GPOUT,125)
    out_o_data_11 <= data_mux_11_x_q;

    -- sr_12_x(REG,183)
    sr_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_12_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_12_x_q <= in_i_data_12;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_12_x(MUX,14)
    data_mux_12_x_s <= sr_valid_q;
    data_mux_12_x_combproc: PROCESS (data_mux_12_x_s, in_i_data_12, sr_12_x_q)
    BEGIN
        CASE (data_mux_12_x_s) IS
            WHEN "0" => data_mux_12_x_q <= in_i_data_12;
            WHEN "1" => data_mux_12_x_q <= sr_12_x_q;
            WHEN OTHERS => data_mux_12_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_12(GPOUT,126)
    out_o_data_12 <= data_mux_12_x_q;

    -- sr_13_x(REG,184)
    sr_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_13_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_13_x_q <= in_i_data_13;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_13_x(MUX,15)
    data_mux_13_x_s <= sr_valid_q;
    data_mux_13_x_combproc: PROCESS (data_mux_13_x_s, in_i_data_13, sr_13_x_q)
    BEGIN
        CASE (data_mux_13_x_s) IS
            WHEN "0" => data_mux_13_x_q <= in_i_data_13;
            WHEN "1" => data_mux_13_x_q <= sr_13_x_q;
            WHEN OTHERS => data_mux_13_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_13(GPOUT,127)
    out_o_data_13 <= data_mux_13_x_q;

    -- sr_14_x(REG,185)
    sr_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_14_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_14_x_q <= in_i_data_14;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_14_x(MUX,16)
    data_mux_14_x_s <= sr_valid_q;
    data_mux_14_x_combproc: PROCESS (data_mux_14_x_s, in_i_data_14, sr_14_x_q)
    BEGIN
        CASE (data_mux_14_x_s) IS
            WHEN "0" => data_mux_14_x_q <= in_i_data_14;
            WHEN "1" => data_mux_14_x_q <= sr_14_x_q;
            WHEN OTHERS => data_mux_14_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_14(GPOUT,128)
    out_o_data_14 <= data_mux_14_x_q;

    -- sr_15_x(REG,186)
    sr_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_15_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_15_x_q <= in_i_data_15;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_15_x(MUX,17)
    data_mux_15_x_s <= sr_valid_q;
    data_mux_15_x_combproc: PROCESS (data_mux_15_x_s, in_i_data_15, sr_15_x_q)
    BEGIN
        CASE (data_mux_15_x_s) IS
            WHEN "0" => data_mux_15_x_q <= in_i_data_15;
            WHEN "1" => data_mux_15_x_q <= sr_15_x_q;
            WHEN OTHERS => data_mux_15_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_15(GPOUT,129)
    out_o_data_15 <= data_mux_15_x_q;

    -- sr_16_x(REG,187)
    sr_16_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_16_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_16_x_q <= in_i_data_16;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_16_x(MUX,18)
    data_mux_16_x_s <= sr_valid_q;
    data_mux_16_x_combproc: PROCESS (data_mux_16_x_s, in_i_data_16, sr_16_x_q)
    BEGIN
        CASE (data_mux_16_x_s) IS
            WHEN "0" => data_mux_16_x_q <= in_i_data_16;
            WHEN "1" => data_mux_16_x_q <= sr_16_x_q;
            WHEN OTHERS => data_mux_16_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_16(GPOUT,130)
    out_o_data_16 <= data_mux_16_x_q;

    -- sr_17_x(REG,188)
    sr_17_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_17_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_17_x_q <= in_i_data_17;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_17_x(MUX,19)
    data_mux_17_x_s <= sr_valid_q;
    data_mux_17_x_combproc: PROCESS (data_mux_17_x_s, in_i_data_17, sr_17_x_q)
    BEGIN
        CASE (data_mux_17_x_s) IS
            WHEN "0" => data_mux_17_x_q <= in_i_data_17;
            WHEN "1" => data_mux_17_x_q <= sr_17_x_q;
            WHEN OTHERS => data_mux_17_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_17(GPOUT,131)
    out_o_data_17 <= data_mux_17_x_q;

    -- sr_18_x(REG,189)
    sr_18_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_18_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_18_x_q <= in_i_data_18;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_18_x(MUX,20)
    data_mux_18_x_s <= sr_valid_q;
    data_mux_18_x_combproc: PROCESS (data_mux_18_x_s, in_i_data_18, sr_18_x_q)
    BEGIN
        CASE (data_mux_18_x_s) IS
            WHEN "0" => data_mux_18_x_q <= in_i_data_18;
            WHEN "1" => data_mux_18_x_q <= sr_18_x_q;
            WHEN OTHERS => data_mux_18_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_18(GPOUT,132)
    out_o_data_18 <= data_mux_18_x_q;

    -- sr_19_x(REG,190)
    sr_19_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_19_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_19_x_q <= in_i_data_19;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_19_x(MUX,21)
    data_mux_19_x_s <= sr_valid_q;
    data_mux_19_x_combproc: PROCESS (data_mux_19_x_s, in_i_data_19, sr_19_x_q)
    BEGIN
        CASE (data_mux_19_x_s) IS
            WHEN "0" => data_mux_19_x_q <= in_i_data_19;
            WHEN "1" => data_mux_19_x_q <= sr_19_x_q;
            WHEN OTHERS => data_mux_19_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_19(GPOUT,133)
    out_o_data_19 <= data_mux_19_x_q;

    -- sr_20_x(REG,191)
    sr_20_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_20_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_20_x_q <= in_i_data_20;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_20_x(MUX,22)
    data_mux_20_x_s <= sr_valid_q;
    data_mux_20_x_combproc: PROCESS (data_mux_20_x_s, in_i_data_20, sr_20_x_q)
    BEGIN
        CASE (data_mux_20_x_s) IS
            WHEN "0" => data_mux_20_x_q <= in_i_data_20;
            WHEN "1" => data_mux_20_x_q <= sr_20_x_q;
            WHEN OTHERS => data_mux_20_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_20(GPOUT,134)
    out_o_data_20 <= data_mux_20_x_q;

    -- sr_21_x(REG,192)
    sr_21_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_21_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_21_x_q <= in_i_data_21;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_21_x(MUX,23)
    data_mux_21_x_s <= sr_valid_q;
    data_mux_21_x_combproc: PROCESS (data_mux_21_x_s, in_i_data_21, sr_21_x_q)
    BEGIN
        CASE (data_mux_21_x_s) IS
            WHEN "0" => data_mux_21_x_q <= in_i_data_21;
            WHEN "1" => data_mux_21_x_q <= sr_21_x_q;
            WHEN OTHERS => data_mux_21_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_21(GPOUT,135)
    out_o_data_21 <= data_mux_21_x_q;

    -- sr_22_x(REG,193)
    sr_22_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_22_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_22_x_q <= in_i_data_22;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_22_x(MUX,24)
    data_mux_22_x_s <= sr_valid_q;
    data_mux_22_x_combproc: PROCESS (data_mux_22_x_s, in_i_data_22, sr_22_x_q)
    BEGIN
        CASE (data_mux_22_x_s) IS
            WHEN "0" => data_mux_22_x_q <= in_i_data_22;
            WHEN "1" => data_mux_22_x_q <= sr_22_x_q;
            WHEN OTHERS => data_mux_22_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_22(GPOUT,136)
    out_o_data_22 <= data_mux_22_x_q;

    -- sr_23_x(REG,194)
    sr_23_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_23_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_23_x_q <= in_i_data_23;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_23_x(MUX,25)
    data_mux_23_x_s <= sr_valid_q;
    data_mux_23_x_combproc: PROCESS (data_mux_23_x_s, in_i_data_23, sr_23_x_q)
    BEGIN
        CASE (data_mux_23_x_s) IS
            WHEN "0" => data_mux_23_x_q <= in_i_data_23;
            WHEN "1" => data_mux_23_x_q <= sr_23_x_q;
            WHEN OTHERS => data_mux_23_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_23(GPOUT,137)
    out_o_data_23 <= data_mux_23_x_q;

    -- sr_24_x(REG,195)
    sr_24_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_24_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_24_x_q <= in_i_data_24;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_24_x(MUX,26)
    data_mux_24_x_s <= sr_valid_q;
    data_mux_24_x_combproc: PROCESS (data_mux_24_x_s, in_i_data_24, sr_24_x_q)
    BEGIN
        CASE (data_mux_24_x_s) IS
            WHEN "0" => data_mux_24_x_q <= in_i_data_24;
            WHEN "1" => data_mux_24_x_q <= sr_24_x_q;
            WHEN OTHERS => data_mux_24_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_24(GPOUT,138)
    out_o_data_24 <= data_mux_24_x_q;

    -- sr_25_x(REG,196)
    sr_25_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_25_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_25_x_q <= in_i_data_25;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_25_x(MUX,27)
    data_mux_25_x_s <= sr_valid_q;
    data_mux_25_x_combproc: PROCESS (data_mux_25_x_s, in_i_data_25, sr_25_x_q)
    BEGIN
        CASE (data_mux_25_x_s) IS
            WHEN "0" => data_mux_25_x_q <= in_i_data_25;
            WHEN "1" => data_mux_25_x_q <= sr_25_x_q;
            WHEN OTHERS => data_mux_25_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_25(GPOUT,139)
    out_o_data_25 <= data_mux_25_x_q;

    -- sr_26_x(REG,197)
    sr_26_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_26_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_26_x_q <= in_i_data_26;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_26_x(MUX,28)
    data_mux_26_x_s <= sr_valid_q;
    data_mux_26_x_combproc: PROCESS (data_mux_26_x_s, in_i_data_26, sr_26_x_q)
    BEGIN
        CASE (data_mux_26_x_s) IS
            WHEN "0" => data_mux_26_x_q <= in_i_data_26;
            WHEN "1" => data_mux_26_x_q <= sr_26_x_q;
            WHEN OTHERS => data_mux_26_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_26(GPOUT,140)
    out_o_data_26 <= data_mux_26_x_q;

    -- sr_27_x(REG,198)
    sr_27_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_27_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_27_x_q <= in_i_data_27;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_27_x(MUX,29)
    data_mux_27_x_s <= sr_valid_q;
    data_mux_27_x_combproc: PROCESS (data_mux_27_x_s, in_i_data_27, sr_27_x_q)
    BEGIN
        CASE (data_mux_27_x_s) IS
            WHEN "0" => data_mux_27_x_q <= in_i_data_27;
            WHEN "1" => data_mux_27_x_q <= sr_27_x_q;
            WHEN OTHERS => data_mux_27_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_27(GPOUT,141)
    out_o_data_27 <= data_mux_27_x_q;

    -- sr_28_x(REG,199)
    sr_28_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_28_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_28_x_q <= in_i_data_28;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_28_x(MUX,30)
    data_mux_28_x_s <= sr_valid_q;
    data_mux_28_x_combproc: PROCESS (data_mux_28_x_s, in_i_data_28, sr_28_x_q)
    BEGIN
        CASE (data_mux_28_x_s) IS
            WHEN "0" => data_mux_28_x_q <= in_i_data_28;
            WHEN "1" => data_mux_28_x_q <= sr_28_x_q;
            WHEN OTHERS => data_mux_28_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_28(GPOUT,142)
    out_o_data_28 <= data_mux_28_x_q;

    -- sr_29_x(REG,200)
    sr_29_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_29_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_29_x_q <= in_i_data_29;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_29_x(MUX,31)
    data_mux_29_x_s <= sr_valid_q;
    data_mux_29_x_combproc: PROCESS (data_mux_29_x_s, in_i_data_29, sr_29_x_q)
    BEGIN
        CASE (data_mux_29_x_s) IS
            WHEN "0" => data_mux_29_x_q <= in_i_data_29;
            WHEN "1" => data_mux_29_x_q <= sr_29_x_q;
            WHEN OTHERS => data_mux_29_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_29(GPOUT,143)
    out_o_data_29 <= data_mux_29_x_q;

    -- sr_30_x(REG,201)
    sr_30_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_30_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_30_x_q <= in_i_data_30;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_30_x(MUX,32)
    data_mux_30_x_s <= sr_valid_q;
    data_mux_30_x_combproc: PROCESS (data_mux_30_x_s, in_i_data_30, sr_30_x_q)
    BEGIN
        CASE (data_mux_30_x_s) IS
            WHEN "0" => data_mux_30_x_q <= in_i_data_30;
            WHEN "1" => data_mux_30_x_q <= sr_30_x_q;
            WHEN OTHERS => data_mux_30_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_30(GPOUT,144)
    out_o_data_30 <= data_mux_30_x_q;

    -- sr_31_x(REG,202)
    sr_31_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_31_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_31_x_q <= in_i_data_31;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_31_x(MUX,33)
    data_mux_31_x_s <= sr_valid_q;
    data_mux_31_x_combproc: PROCESS (data_mux_31_x_s, in_i_data_31, sr_31_x_q)
    BEGIN
        CASE (data_mux_31_x_s) IS
            WHEN "0" => data_mux_31_x_q <= in_i_data_31;
            WHEN "1" => data_mux_31_x_q <= sr_31_x_q;
            WHEN OTHERS => data_mux_31_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_31(GPOUT,145)
    out_o_data_31 <= data_mux_31_x_q;

    -- sr_32_x(REG,203)
    sr_32_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_32_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_32_x_q <= in_i_data_32;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_32_x(MUX,34)
    data_mux_32_x_s <= sr_valid_q;
    data_mux_32_x_combproc: PROCESS (data_mux_32_x_s, in_i_data_32, sr_32_x_q)
    BEGIN
        CASE (data_mux_32_x_s) IS
            WHEN "0" => data_mux_32_x_q <= in_i_data_32;
            WHEN "1" => data_mux_32_x_q <= sr_32_x_q;
            WHEN OTHERS => data_mux_32_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_32(GPOUT,146)
    out_o_data_32 <= data_mux_32_x_q;

    -- sr_33_x(REG,204)
    sr_33_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_33_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_33_x_q <= in_i_data_33;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_33_x(MUX,35)
    data_mux_33_x_s <= sr_valid_q;
    data_mux_33_x_combproc: PROCESS (data_mux_33_x_s, in_i_data_33, sr_33_x_q)
    BEGIN
        CASE (data_mux_33_x_s) IS
            WHEN "0" => data_mux_33_x_q <= in_i_data_33;
            WHEN "1" => data_mux_33_x_q <= sr_33_x_q;
            WHEN OTHERS => data_mux_33_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_33(GPOUT,147)
    out_o_data_33 <= data_mux_33_x_q;

    -- sr_34_x(REG,205)
    sr_34_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_34_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_34_x_q <= in_i_data_34;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_34_x(MUX,36)
    data_mux_34_x_s <= sr_valid_q;
    data_mux_34_x_combproc: PROCESS (data_mux_34_x_s, in_i_data_34, sr_34_x_q)
    BEGIN
        CASE (data_mux_34_x_s) IS
            WHEN "0" => data_mux_34_x_q <= in_i_data_34;
            WHEN "1" => data_mux_34_x_q <= sr_34_x_q;
            WHEN OTHERS => data_mux_34_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_34(GPOUT,148)
    out_o_data_34 <= data_mux_34_x_q;

    -- sr_35_x(REG,206)
    sr_35_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_35_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_35_x_q <= in_i_data_35;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_35_x(MUX,37)
    data_mux_35_x_s <= sr_valid_q;
    data_mux_35_x_combproc: PROCESS (data_mux_35_x_s, in_i_data_35, sr_35_x_q)
    BEGIN
        CASE (data_mux_35_x_s) IS
            WHEN "0" => data_mux_35_x_q <= in_i_data_35;
            WHEN "1" => data_mux_35_x_q <= sr_35_x_q;
            WHEN OTHERS => data_mux_35_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_35(GPOUT,149)
    out_o_data_35 <= data_mux_35_x_q;

    -- sr_36_x(REG,207)
    sr_36_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_36_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_36_x_q <= in_i_data_36;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_36_x(MUX,38)
    data_mux_36_x_s <= sr_valid_q;
    data_mux_36_x_combproc: PROCESS (data_mux_36_x_s, in_i_data_36, sr_36_x_q)
    BEGIN
        CASE (data_mux_36_x_s) IS
            WHEN "0" => data_mux_36_x_q <= in_i_data_36;
            WHEN "1" => data_mux_36_x_q <= sr_36_x_q;
            WHEN OTHERS => data_mux_36_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_36(GPOUT,150)
    out_o_data_36 <= data_mux_36_x_q;

    -- sr_37_x(REG,208)
    sr_37_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_37_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_37_x_q <= in_i_data_37;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_37_x(MUX,39)
    data_mux_37_x_s <= sr_valid_q;
    data_mux_37_x_combproc: PROCESS (data_mux_37_x_s, in_i_data_37, sr_37_x_q)
    BEGIN
        CASE (data_mux_37_x_s) IS
            WHEN "0" => data_mux_37_x_q <= in_i_data_37;
            WHEN "1" => data_mux_37_x_q <= sr_37_x_q;
            WHEN OTHERS => data_mux_37_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_37(GPOUT,151)
    out_o_data_37 <= data_mux_37_x_q;

    -- sr_38_x(REG,209)
    sr_38_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_38_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_38_x_q <= in_i_data_38;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_38_x(MUX,40)
    data_mux_38_x_s <= sr_valid_q;
    data_mux_38_x_combproc: PROCESS (data_mux_38_x_s, in_i_data_38, sr_38_x_q)
    BEGIN
        CASE (data_mux_38_x_s) IS
            WHEN "0" => data_mux_38_x_q <= in_i_data_38;
            WHEN "1" => data_mux_38_x_q <= sr_38_x_q;
            WHEN OTHERS => data_mux_38_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_38(GPOUT,152)
    out_o_data_38 <= data_mux_38_x_q;

    -- sr_39_x(REG,210)
    sr_39_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_39_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_39_x_q <= in_i_data_39;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_39_x(MUX,41)
    data_mux_39_x_s <= sr_valid_q;
    data_mux_39_x_combproc: PROCESS (data_mux_39_x_s, in_i_data_39, sr_39_x_q)
    BEGIN
        CASE (data_mux_39_x_s) IS
            WHEN "0" => data_mux_39_x_q <= in_i_data_39;
            WHEN "1" => data_mux_39_x_q <= sr_39_x_q;
            WHEN OTHERS => data_mux_39_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_39(GPOUT,153)
    out_o_data_39 <= data_mux_39_x_q;

    -- sr_40_x(REG,211)
    sr_40_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_40_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_40_x_q <= in_i_data_40;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_40_x(MUX,42)
    data_mux_40_x_s <= sr_valid_q;
    data_mux_40_x_combproc: PROCESS (data_mux_40_x_s, in_i_data_40, sr_40_x_q)
    BEGIN
        CASE (data_mux_40_x_s) IS
            WHEN "0" => data_mux_40_x_q <= in_i_data_40;
            WHEN "1" => data_mux_40_x_q <= sr_40_x_q;
            WHEN OTHERS => data_mux_40_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_40(GPOUT,154)
    out_o_data_40 <= data_mux_40_x_q;

    -- sr_41_x(REG,212)
    sr_41_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_41_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_41_x_q <= in_i_data_41;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_41_x(MUX,43)
    data_mux_41_x_s <= sr_valid_q;
    data_mux_41_x_combproc: PROCESS (data_mux_41_x_s, in_i_data_41, sr_41_x_q)
    BEGIN
        CASE (data_mux_41_x_s) IS
            WHEN "0" => data_mux_41_x_q <= in_i_data_41;
            WHEN "1" => data_mux_41_x_q <= sr_41_x_q;
            WHEN OTHERS => data_mux_41_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_41(GPOUT,155)
    out_o_data_41 <= data_mux_41_x_q;

    -- sr_42_x(REG,213)
    sr_42_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_42_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_42_x_q <= in_i_data_42;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_42_x(MUX,44)
    data_mux_42_x_s <= sr_valid_q;
    data_mux_42_x_combproc: PROCESS (data_mux_42_x_s, in_i_data_42, sr_42_x_q)
    BEGIN
        CASE (data_mux_42_x_s) IS
            WHEN "0" => data_mux_42_x_q <= in_i_data_42;
            WHEN "1" => data_mux_42_x_q <= sr_42_x_q;
            WHEN OTHERS => data_mux_42_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_42(GPOUT,156)
    out_o_data_42 <= data_mux_42_x_q;

    -- sr_43_x(REG,214)
    sr_43_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_43_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_43_x_q <= in_i_data_43;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_43_x(MUX,45)
    data_mux_43_x_s <= sr_valid_q;
    data_mux_43_x_combproc: PROCESS (data_mux_43_x_s, in_i_data_43, sr_43_x_q)
    BEGIN
        CASE (data_mux_43_x_s) IS
            WHEN "0" => data_mux_43_x_q <= in_i_data_43;
            WHEN "1" => data_mux_43_x_q <= sr_43_x_q;
            WHEN OTHERS => data_mux_43_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_43(GPOUT,157)
    out_o_data_43 <= data_mux_43_x_q;

    -- sr_44_x(REG,215)
    sr_44_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_44_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_44_x_q <= in_i_data_44;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_44_x(MUX,46)
    data_mux_44_x_s <= sr_valid_q;
    data_mux_44_x_combproc: PROCESS (data_mux_44_x_s, in_i_data_44, sr_44_x_q)
    BEGIN
        CASE (data_mux_44_x_s) IS
            WHEN "0" => data_mux_44_x_q <= in_i_data_44;
            WHEN "1" => data_mux_44_x_q <= sr_44_x_q;
            WHEN OTHERS => data_mux_44_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_44(GPOUT,158)
    out_o_data_44 <= data_mux_44_x_q;

    -- sr_45_x(REG,216)
    sr_45_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_45_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_45_x_q <= in_i_data_45;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_45_x(MUX,47)
    data_mux_45_x_s <= sr_valid_q;
    data_mux_45_x_combproc: PROCESS (data_mux_45_x_s, in_i_data_45, sr_45_x_q)
    BEGIN
        CASE (data_mux_45_x_s) IS
            WHEN "0" => data_mux_45_x_q <= in_i_data_45;
            WHEN "1" => data_mux_45_x_q <= sr_45_x_q;
            WHEN OTHERS => data_mux_45_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_45(GPOUT,159)
    out_o_data_45 <= data_mux_45_x_q;

    -- sr_46_x(REG,217)
    sr_46_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_46_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_46_x_q <= in_i_data_46;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_46_x(MUX,48)
    data_mux_46_x_s <= sr_valid_q;
    data_mux_46_x_combproc: PROCESS (data_mux_46_x_s, in_i_data_46, sr_46_x_q)
    BEGIN
        CASE (data_mux_46_x_s) IS
            WHEN "0" => data_mux_46_x_q <= in_i_data_46;
            WHEN "1" => data_mux_46_x_q <= sr_46_x_q;
            WHEN OTHERS => data_mux_46_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_46(GPOUT,160)
    out_o_data_46 <= data_mux_46_x_q;

    -- sr_47_x(REG,218)
    sr_47_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_47_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_47_x_q <= in_i_data_47;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_47_x(MUX,49)
    data_mux_47_x_s <= sr_valid_q;
    data_mux_47_x_combproc: PROCESS (data_mux_47_x_s, in_i_data_47, sr_47_x_q)
    BEGIN
        CASE (data_mux_47_x_s) IS
            WHEN "0" => data_mux_47_x_q <= in_i_data_47;
            WHEN "1" => data_mux_47_x_q <= sr_47_x_q;
            WHEN OTHERS => data_mux_47_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_47(GPOUT,161)
    out_o_data_47 <= data_mux_47_x_q;

    -- sr_48_x(REG,219)
    sr_48_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_48_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_48_x_q <= in_i_data_48;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_48_x(MUX,50)
    data_mux_48_x_s <= sr_valid_q;
    data_mux_48_x_combproc: PROCESS (data_mux_48_x_s, in_i_data_48, sr_48_x_q)
    BEGIN
        CASE (data_mux_48_x_s) IS
            WHEN "0" => data_mux_48_x_q <= in_i_data_48;
            WHEN "1" => data_mux_48_x_q <= sr_48_x_q;
            WHEN OTHERS => data_mux_48_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_48(GPOUT,162)
    out_o_data_48 <= data_mux_48_x_q;

    -- sr_49_x(REG,220)
    sr_49_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_49_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_49_x_q <= in_i_data_49;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_49_x(MUX,51)
    data_mux_49_x_s <= sr_valid_q;
    data_mux_49_x_combproc: PROCESS (data_mux_49_x_s, in_i_data_49, sr_49_x_q)
    BEGIN
        CASE (data_mux_49_x_s) IS
            WHEN "0" => data_mux_49_x_q <= in_i_data_49;
            WHEN "1" => data_mux_49_x_q <= sr_49_x_q;
            WHEN OTHERS => data_mux_49_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_49(GPOUT,163)
    out_o_data_49 <= data_mux_49_x_q;

    -- sr_50_x(REG,221)
    sr_50_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_50_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_50_x_q <= in_i_data_50;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_50_x(MUX,52)
    data_mux_50_x_s <= sr_valid_q;
    data_mux_50_x_combproc: PROCESS (data_mux_50_x_s, in_i_data_50, sr_50_x_q)
    BEGIN
        CASE (data_mux_50_x_s) IS
            WHEN "0" => data_mux_50_x_q <= in_i_data_50;
            WHEN "1" => data_mux_50_x_q <= sr_50_x_q;
            WHEN OTHERS => data_mux_50_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_50(GPOUT,164)
    out_o_data_50 <= data_mux_50_x_q;

    -- sr_51_x(REG,222)
    sr_51_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_51_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_51_x_q <= in_i_data_51;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_51_x(MUX,53)
    data_mux_51_x_s <= sr_valid_q;
    data_mux_51_x_combproc: PROCESS (data_mux_51_x_s, in_i_data_51, sr_51_x_q)
    BEGIN
        CASE (data_mux_51_x_s) IS
            WHEN "0" => data_mux_51_x_q <= in_i_data_51;
            WHEN "1" => data_mux_51_x_q <= sr_51_x_q;
            WHEN OTHERS => data_mux_51_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_51(GPOUT,165)
    out_o_data_51 <= data_mux_51_x_q;

    -- sr_52_x(REG,223)
    sr_52_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_52_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_52_x_q <= in_i_data_52;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_52_x(MUX,54)
    data_mux_52_x_s <= sr_valid_q;
    data_mux_52_x_combproc: PROCESS (data_mux_52_x_s, in_i_data_52, sr_52_x_q)
    BEGIN
        CASE (data_mux_52_x_s) IS
            WHEN "0" => data_mux_52_x_q <= in_i_data_52;
            WHEN "1" => data_mux_52_x_q <= sr_52_x_q;
            WHEN OTHERS => data_mux_52_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_52(GPOUT,166)
    out_o_data_52 <= data_mux_52_x_q;

    -- sr_53_x(REG,224)
    sr_53_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_53_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_53_x_q <= in_i_data_53;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_53_x(MUX,55)
    data_mux_53_x_s <= sr_valid_q;
    data_mux_53_x_combproc: PROCESS (data_mux_53_x_s, in_i_data_53, sr_53_x_q)
    BEGIN
        CASE (data_mux_53_x_s) IS
            WHEN "0" => data_mux_53_x_q <= in_i_data_53;
            WHEN "1" => data_mux_53_x_q <= sr_53_x_q;
            WHEN OTHERS => data_mux_53_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_53(GPOUT,167)
    out_o_data_53 <= data_mux_53_x_q;

    -- sr_54_x(REG,225)
    sr_54_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_54_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_54_x_q <= in_i_data_54;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_54_x(MUX,56)
    data_mux_54_x_s <= sr_valid_q;
    data_mux_54_x_combproc: PROCESS (data_mux_54_x_s, in_i_data_54, sr_54_x_q)
    BEGIN
        CASE (data_mux_54_x_s) IS
            WHEN "0" => data_mux_54_x_q <= in_i_data_54;
            WHEN "1" => data_mux_54_x_q <= sr_54_x_q;
            WHEN OTHERS => data_mux_54_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_54(GPOUT,168)
    out_o_data_54 <= data_mux_54_x_q;

    -- out_o_stall(GPOUT,169)
    out_o_stall <= sr_valid_q;

    -- out_o_valid(GPOUT,170)
    out_o_valid <= combined_valid_q;

END normal;
