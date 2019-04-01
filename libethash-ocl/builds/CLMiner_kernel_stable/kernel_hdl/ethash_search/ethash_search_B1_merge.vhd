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

-- VHDL created from ethash_search_B1_merge
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

entity ethash_search_B1_merge is
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
        in_global_id_0197_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0197_1 : in std_logic_vector(31 downto 0);  -- ufix32
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_arrayidx10_i_i803 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx12_i_i806 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx14_i_i809 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx16_i_i812 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx1_i_i856 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx20_i_i817 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx22_i_i820 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx24_i_i823 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx26_i_i826 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx2_i_i795 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx30_i_i871 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx32_i_i834 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx34_i_i837 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx36_i_i840 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx39_i_i843 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx40_i_i845 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx42_i_i848 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx44_i_i851 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx46_i_i854 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx4_i_i797 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx6_i_i799 : out std_logic_vector(63 downto 0);  -- ufix64
        out_fpgaindvars_iv15 : out std_logic_vector(5 downto 0);  -- ufix6
        out_global_id_0197 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_08 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_r_0_i_ph : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B1_merge;

architecture normal of ethash_search_B1_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component priority_encoder is
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
    signal arrayidx10_i_i803_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx10_i_i803_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx12_i_i806_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx12_i_i806_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx14_i_i809_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx14_i_i809_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx16_i_i812_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx16_i_i812_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx1_i_i856_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx1_i_i856_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx20_i_i817_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx20_i_i817_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx22_i_i820_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx22_i_i820_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx24_i_i823_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx24_i_i823_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx26_i_i826_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx26_i_i826_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx2_i_i795_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx2_i_i795_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx30_i_i871_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx30_i_i871_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx32_i_i834_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx32_i_i834_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx34_i_i837_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx34_i_i837_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx36_i_i840_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx36_i_i840_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx39_i_i843_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx39_i_i843_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx40_i_i845_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx40_i_i845_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx42_i_i848_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx42_i_i848_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx44_i_i851_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx44_i_i851_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx46_i_i854_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx46_i_i854_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx4_i_i797_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx4_i_i797_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx6_i_i799_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx6_i_i799_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal fpgaindvars_iv15_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv15_mux_q : STD_LOGIC_VECTOR (5 downto 0);
    signal global_id_0197_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_0197_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_08_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_08_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr13_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_0_addr13_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_select_q : STD_LOGIC_VECTOR (0 downto 0);
    signal priority_encoder_out_o_select : STD_LOGIC_VECTOR (0 downto 0);
    signal priority_encoder_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal r_0_i_ph_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_0_i_ph_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01001_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01001_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01003_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01003_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01005_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01005_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01007_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01007_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0987_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0987_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0989_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0989_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0991_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0991_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0993_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0993_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0995_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0995_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0997_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0997_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0999_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0999_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11000_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11000_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11002_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11002_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11004_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11004_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11006_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11006_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11008_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11008_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1988_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1988_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1990_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1990_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1992_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1992_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1994_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1994_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1996_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1996_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1998_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1998_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_0_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- priority_encoder(BLACKBOX,185)
    thepriority_encoder : priority_encoder
    PORT MAP (
        in_i_stall => in_stall_in,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        in_workgroup_size => in_encoder_ethash_search_B1_merge_priority_encoder_workgroup_size,
        out_o_select => priority_encoder_out_o_select,
        out_o_valid => priority_encoder_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- arrayidx10_i_i803_mux(MUX,2)
    arrayidx10_i_i803_mux_s <= priority_encoder_out_o_select;
    arrayidx10_i_i803_mux_combproc: PROCESS (arrayidx10_i_i803_mux_s, in_arrayidx10_i_i803_0, in_arrayidx10_i_i803_1)
    BEGIN
        CASE (arrayidx10_i_i803_mux_s) IS
            WHEN "0" => arrayidx10_i_i803_mux_q <= in_arrayidx10_i_i803_0;
            WHEN "1" => arrayidx10_i_i803_mux_q <= in_arrayidx10_i_i803_1;
            WHEN OTHERS => arrayidx10_i_i803_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx10_i_i803(GPOUT,132)
    out_arrayidx10_i_i803 <= arrayidx10_i_i803_mux_q;

    -- arrayidx12_i_i806_mux(MUX,3)
    arrayidx12_i_i806_mux_s <= priority_encoder_out_o_select;
    arrayidx12_i_i806_mux_combproc: PROCESS (arrayidx12_i_i806_mux_s, in_arrayidx12_i_i806_0, in_arrayidx12_i_i806_1)
    BEGIN
        CASE (arrayidx12_i_i806_mux_s) IS
            WHEN "0" => arrayidx12_i_i806_mux_q <= in_arrayidx12_i_i806_0;
            WHEN "1" => arrayidx12_i_i806_mux_q <= in_arrayidx12_i_i806_1;
            WHEN OTHERS => arrayidx12_i_i806_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx12_i_i806(GPOUT,133)
    out_arrayidx12_i_i806 <= arrayidx12_i_i806_mux_q;

    -- arrayidx14_i_i809_mux(MUX,4)
    arrayidx14_i_i809_mux_s <= priority_encoder_out_o_select;
    arrayidx14_i_i809_mux_combproc: PROCESS (arrayidx14_i_i809_mux_s, in_arrayidx14_i_i809_0, in_arrayidx14_i_i809_1)
    BEGIN
        CASE (arrayidx14_i_i809_mux_s) IS
            WHEN "0" => arrayidx14_i_i809_mux_q <= in_arrayidx14_i_i809_0;
            WHEN "1" => arrayidx14_i_i809_mux_q <= in_arrayidx14_i_i809_1;
            WHEN OTHERS => arrayidx14_i_i809_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx14_i_i809(GPOUT,134)
    out_arrayidx14_i_i809 <= arrayidx14_i_i809_mux_q;

    -- arrayidx16_i_i812_mux(MUX,5)
    arrayidx16_i_i812_mux_s <= priority_encoder_out_o_select;
    arrayidx16_i_i812_mux_combproc: PROCESS (arrayidx16_i_i812_mux_s, in_arrayidx16_i_i812_0, in_arrayidx16_i_i812_1)
    BEGIN
        CASE (arrayidx16_i_i812_mux_s) IS
            WHEN "0" => arrayidx16_i_i812_mux_q <= in_arrayidx16_i_i812_0;
            WHEN "1" => arrayidx16_i_i812_mux_q <= in_arrayidx16_i_i812_1;
            WHEN OTHERS => arrayidx16_i_i812_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx16_i_i812(GPOUT,135)
    out_arrayidx16_i_i812 <= arrayidx16_i_i812_mux_q;

    -- arrayidx1_i_i856_mux(MUX,6)
    arrayidx1_i_i856_mux_s <= priority_encoder_out_o_select;
    arrayidx1_i_i856_mux_combproc: PROCESS (arrayidx1_i_i856_mux_s, in_arrayidx1_i_i856_0, in_arrayidx1_i_i856_1)
    BEGIN
        CASE (arrayidx1_i_i856_mux_s) IS
            WHEN "0" => arrayidx1_i_i856_mux_q <= in_arrayidx1_i_i856_0;
            WHEN "1" => arrayidx1_i_i856_mux_q <= in_arrayidx1_i_i856_1;
            WHEN OTHERS => arrayidx1_i_i856_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx1_i_i856(GPOUT,136)
    out_arrayidx1_i_i856 <= arrayidx1_i_i856_mux_q;

    -- arrayidx20_i_i817_mux(MUX,7)
    arrayidx20_i_i817_mux_s <= priority_encoder_out_o_select;
    arrayidx20_i_i817_mux_combproc: PROCESS (arrayidx20_i_i817_mux_s, in_arrayidx20_i_i817_0, in_arrayidx20_i_i817_1)
    BEGIN
        CASE (arrayidx20_i_i817_mux_s) IS
            WHEN "0" => arrayidx20_i_i817_mux_q <= in_arrayidx20_i_i817_0;
            WHEN "1" => arrayidx20_i_i817_mux_q <= in_arrayidx20_i_i817_1;
            WHEN OTHERS => arrayidx20_i_i817_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx20_i_i817(GPOUT,137)
    out_arrayidx20_i_i817 <= arrayidx20_i_i817_mux_q;

    -- arrayidx22_i_i820_mux(MUX,8)
    arrayidx22_i_i820_mux_s <= priority_encoder_out_o_select;
    arrayidx22_i_i820_mux_combproc: PROCESS (arrayidx22_i_i820_mux_s, in_arrayidx22_i_i820_0, in_arrayidx22_i_i820_1)
    BEGIN
        CASE (arrayidx22_i_i820_mux_s) IS
            WHEN "0" => arrayidx22_i_i820_mux_q <= in_arrayidx22_i_i820_0;
            WHEN "1" => arrayidx22_i_i820_mux_q <= in_arrayidx22_i_i820_1;
            WHEN OTHERS => arrayidx22_i_i820_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx22_i_i820(GPOUT,138)
    out_arrayidx22_i_i820 <= arrayidx22_i_i820_mux_q;

    -- arrayidx24_i_i823_mux(MUX,9)
    arrayidx24_i_i823_mux_s <= priority_encoder_out_o_select;
    arrayidx24_i_i823_mux_combproc: PROCESS (arrayidx24_i_i823_mux_s, in_arrayidx24_i_i823_0, in_arrayidx24_i_i823_1)
    BEGIN
        CASE (arrayidx24_i_i823_mux_s) IS
            WHEN "0" => arrayidx24_i_i823_mux_q <= in_arrayidx24_i_i823_0;
            WHEN "1" => arrayidx24_i_i823_mux_q <= in_arrayidx24_i_i823_1;
            WHEN OTHERS => arrayidx24_i_i823_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx24_i_i823(GPOUT,139)
    out_arrayidx24_i_i823 <= arrayidx24_i_i823_mux_q;

    -- arrayidx26_i_i826_mux(MUX,10)
    arrayidx26_i_i826_mux_s <= priority_encoder_out_o_select;
    arrayidx26_i_i826_mux_combproc: PROCESS (arrayidx26_i_i826_mux_s, in_arrayidx26_i_i826_0, in_arrayidx26_i_i826_1)
    BEGIN
        CASE (arrayidx26_i_i826_mux_s) IS
            WHEN "0" => arrayidx26_i_i826_mux_q <= in_arrayidx26_i_i826_0;
            WHEN "1" => arrayidx26_i_i826_mux_q <= in_arrayidx26_i_i826_1;
            WHEN OTHERS => arrayidx26_i_i826_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx26_i_i826(GPOUT,140)
    out_arrayidx26_i_i826 <= arrayidx26_i_i826_mux_q;

    -- arrayidx2_i_i795_mux(MUX,11)
    arrayidx2_i_i795_mux_s <= priority_encoder_out_o_select;
    arrayidx2_i_i795_mux_combproc: PROCESS (arrayidx2_i_i795_mux_s, in_arrayidx2_i_i795_0, in_arrayidx2_i_i795_1)
    BEGIN
        CASE (arrayidx2_i_i795_mux_s) IS
            WHEN "0" => arrayidx2_i_i795_mux_q <= in_arrayidx2_i_i795_0;
            WHEN "1" => arrayidx2_i_i795_mux_q <= in_arrayidx2_i_i795_1;
            WHEN OTHERS => arrayidx2_i_i795_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx2_i_i795(GPOUT,141)
    out_arrayidx2_i_i795 <= arrayidx2_i_i795_mux_q;

    -- arrayidx30_i_i871_mux(MUX,12)
    arrayidx30_i_i871_mux_s <= priority_encoder_out_o_select;
    arrayidx30_i_i871_mux_combproc: PROCESS (arrayidx30_i_i871_mux_s, in_arrayidx30_i_i871_0, in_arrayidx30_i_i871_1)
    BEGIN
        CASE (arrayidx30_i_i871_mux_s) IS
            WHEN "0" => arrayidx30_i_i871_mux_q <= in_arrayidx30_i_i871_0;
            WHEN "1" => arrayidx30_i_i871_mux_q <= in_arrayidx30_i_i871_1;
            WHEN OTHERS => arrayidx30_i_i871_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx30_i_i871(GPOUT,142)
    out_arrayidx30_i_i871 <= arrayidx30_i_i871_mux_q;

    -- arrayidx32_i_i834_mux(MUX,13)
    arrayidx32_i_i834_mux_s <= priority_encoder_out_o_select;
    arrayidx32_i_i834_mux_combproc: PROCESS (arrayidx32_i_i834_mux_s, in_arrayidx32_i_i834_0, in_arrayidx32_i_i834_1)
    BEGIN
        CASE (arrayidx32_i_i834_mux_s) IS
            WHEN "0" => arrayidx32_i_i834_mux_q <= in_arrayidx32_i_i834_0;
            WHEN "1" => arrayidx32_i_i834_mux_q <= in_arrayidx32_i_i834_1;
            WHEN OTHERS => arrayidx32_i_i834_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx32_i_i834(GPOUT,143)
    out_arrayidx32_i_i834 <= arrayidx32_i_i834_mux_q;

    -- arrayidx34_i_i837_mux(MUX,14)
    arrayidx34_i_i837_mux_s <= priority_encoder_out_o_select;
    arrayidx34_i_i837_mux_combproc: PROCESS (arrayidx34_i_i837_mux_s, in_arrayidx34_i_i837_0, in_arrayidx34_i_i837_1)
    BEGIN
        CASE (arrayidx34_i_i837_mux_s) IS
            WHEN "0" => arrayidx34_i_i837_mux_q <= in_arrayidx34_i_i837_0;
            WHEN "1" => arrayidx34_i_i837_mux_q <= in_arrayidx34_i_i837_1;
            WHEN OTHERS => arrayidx34_i_i837_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx34_i_i837(GPOUT,144)
    out_arrayidx34_i_i837 <= arrayidx34_i_i837_mux_q;

    -- arrayidx36_i_i840_mux(MUX,15)
    arrayidx36_i_i840_mux_s <= priority_encoder_out_o_select;
    arrayidx36_i_i840_mux_combproc: PROCESS (arrayidx36_i_i840_mux_s, in_arrayidx36_i_i840_0, in_arrayidx36_i_i840_1)
    BEGIN
        CASE (arrayidx36_i_i840_mux_s) IS
            WHEN "0" => arrayidx36_i_i840_mux_q <= in_arrayidx36_i_i840_0;
            WHEN "1" => arrayidx36_i_i840_mux_q <= in_arrayidx36_i_i840_1;
            WHEN OTHERS => arrayidx36_i_i840_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx36_i_i840(GPOUT,145)
    out_arrayidx36_i_i840 <= arrayidx36_i_i840_mux_q;

    -- arrayidx39_i_i843_mux(MUX,16)
    arrayidx39_i_i843_mux_s <= priority_encoder_out_o_select;
    arrayidx39_i_i843_mux_combproc: PROCESS (arrayidx39_i_i843_mux_s, in_arrayidx39_i_i843_0, in_arrayidx39_i_i843_1)
    BEGIN
        CASE (arrayidx39_i_i843_mux_s) IS
            WHEN "0" => arrayidx39_i_i843_mux_q <= in_arrayidx39_i_i843_0;
            WHEN "1" => arrayidx39_i_i843_mux_q <= in_arrayidx39_i_i843_1;
            WHEN OTHERS => arrayidx39_i_i843_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx39_i_i843(GPOUT,146)
    out_arrayidx39_i_i843 <= arrayidx39_i_i843_mux_q;

    -- arrayidx40_i_i845_mux(MUX,17)
    arrayidx40_i_i845_mux_s <= priority_encoder_out_o_select;
    arrayidx40_i_i845_mux_combproc: PROCESS (arrayidx40_i_i845_mux_s, in_arrayidx40_i_i845_0, in_arrayidx40_i_i845_1)
    BEGIN
        CASE (arrayidx40_i_i845_mux_s) IS
            WHEN "0" => arrayidx40_i_i845_mux_q <= in_arrayidx40_i_i845_0;
            WHEN "1" => arrayidx40_i_i845_mux_q <= in_arrayidx40_i_i845_1;
            WHEN OTHERS => arrayidx40_i_i845_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx40_i_i845(GPOUT,147)
    out_arrayidx40_i_i845 <= arrayidx40_i_i845_mux_q;

    -- arrayidx42_i_i848_mux(MUX,18)
    arrayidx42_i_i848_mux_s <= priority_encoder_out_o_select;
    arrayidx42_i_i848_mux_combproc: PROCESS (arrayidx42_i_i848_mux_s, in_arrayidx42_i_i848_0, in_arrayidx42_i_i848_1)
    BEGIN
        CASE (arrayidx42_i_i848_mux_s) IS
            WHEN "0" => arrayidx42_i_i848_mux_q <= in_arrayidx42_i_i848_0;
            WHEN "1" => arrayidx42_i_i848_mux_q <= in_arrayidx42_i_i848_1;
            WHEN OTHERS => arrayidx42_i_i848_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx42_i_i848(GPOUT,148)
    out_arrayidx42_i_i848 <= arrayidx42_i_i848_mux_q;

    -- arrayidx44_i_i851_mux(MUX,19)
    arrayidx44_i_i851_mux_s <= priority_encoder_out_o_select;
    arrayidx44_i_i851_mux_combproc: PROCESS (arrayidx44_i_i851_mux_s, in_arrayidx44_i_i851_0, in_arrayidx44_i_i851_1)
    BEGIN
        CASE (arrayidx44_i_i851_mux_s) IS
            WHEN "0" => arrayidx44_i_i851_mux_q <= in_arrayidx44_i_i851_0;
            WHEN "1" => arrayidx44_i_i851_mux_q <= in_arrayidx44_i_i851_1;
            WHEN OTHERS => arrayidx44_i_i851_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx44_i_i851(GPOUT,149)
    out_arrayidx44_i_i851 <= arrayidx44_i_i851_mux_q;

    -- arrayidx46_i_i854_mux(MUX,20)
    arrayidx46_i_i854_mux_s <= priority_encoder_out_o_select;
    arrayidx46_i_i854_mux_combproc: PROCESS (arrayidx46_i_i854_mux_s, in_arrayidx46_i_i854_0, in_arrayidx46_i_i854_1)
    BEGIN
        CASE (arrayidx46_i_i854_mux_s) IS
            WHEN "0" => arrayidx46_i_i854_mux_q <= in_arrayidx46_i_i854_0;
            WHEN "1" => arrayidx46_i_i854_mux_q <= in_arrayidx46_i_i854_1;
            WHEN OTHERS => arrayidx46_i_i854_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx46_i_i854(GPOUT,150)
    out_arrayidx46_i_i854 <= arrayidx46_i_i854_mux_q;

    -- arrayidx4_i_i797_mux(MUX,21)
    arrayidx4_i_i797_mux_s <= priority_encoder_out_o_select;
    arrayidx4_i_i797_mux_combproc: PROCESS (arrayidx4_i_i797_mux_s, in_arrayidx4_i_i797_0, in_arrayidx4_i_i797_1)
    BEGIN
        CASE (arrayidx4_i_i797_mux_s) IS
            WHEN "0" => arrayidx4_i_i797_mux_q <= in_arrayidx4_i_i797_0;
            WHEN "1" => arrayidx4_i_i797_mux_q <= in_arrayidx4_i_i797_1;
            WHEN OTHERS => arrayidx4_i_i797_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx4_i_i797(GPOUT,151)
    out_arrayidx4_i_i797 <= arrayidx4_i_i797_mux_q;

    -- arrayidx6_i_i799_mux(MUX,22)
    arrayidx6_i_i799_mux_s <= priority_encoder_out_o_select;
    arrayidx6_i_i799_mux_combproc: PROCESS (arrayidx6_i_i799_mux_s, in_arrayidx6_i_i799_0, in_arrayidx6_i_i799_1)
    BEGIN
        CASE (arrayidx6_i_i799_mux_s) IS
            WHEN "0" => arrayidx6_i_i799_mux_q <= in_arrayidx6_i_i799_0;
            WHEN "1" => arrayidx6_i_i799_mux_q <= in_arrayidx6_i_i799_1;
            WHEN OTHERS => arrayidx6_i_i799_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx6_i_i799(GPOUT,152)
    out_arrayidx6_i_i799 <= arrayidx6_i_i799_mux_q;

    -- fpgaindvars_iv15_mux(MUX,23)
    fpgaindvars_iv15_mux_s <= priority_encoder_out_o_select;
    fpgaindvars_iv15_mux_combproc: PROCESS (fpgaindvars_iv15_mux_s, in_fpgaindvars_iv15_0, in_fpgaindvars_iv15_1)
    BEGIN
        CASE (fpgaindvars_iv15_mux_s) IS
            WHEN "0" => fpgaindvars_iv15_mux_q <= in_fpgaindvars_iv15_0;
            WHEN "1" => fpgaindvars_iv15_mux_q <= in_fpgaindvars_iv15_1;
            WHEN OTHERS => fpgaindvars_iv15_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv15(GPOUT,153)
    out_fpgaindvars_iv15 <= fpgaindvars_iv15_mux_q;

    -- global_id_0197_mux(MUX,24)
    global_id_0197_mux_s <= priority_encoder_out_o_select;
    global_id_0197_mux_combproc: PROCESS (global_id_0197_mux_s, in_global_id_0197_0, in_global_id_0197_1)
    BEGIN
        CASE (global_id_0197_mux_s) IS
            WHEN "0" => global_id_0197_mux_q <= in_global_id_0197_0;
            WHEN "1" => global_id_0197_mux_q <= in_global_id_0197_1;
            WHEN OTHERS => global_id_0197_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_global_id_0197(GPOUT,154)
    out_global_id_0197 <= global_id_0197_mux_q;

    -- l_grpid_08_mux(MUX,129)
    l_grpid_08_mux_s <= priority_encoder_out_o_select;
    l_grpid_08_mux_combproc: PROCESS (l_grpid_08_mux_s, in_l_grpid_08_0, in_l_grpid_08_1)
    BEGIN
        CASE (l_grpid_08_mux_s) IS
            WHEN "0" => l_grpid_08_mux_q <= in_l_grpid_08_0;
            WHEN "1" => l_grpid_08_mux_q <= in_l_grpid_08_1;
            WHEN OTHERS => l_grpid_08_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_08(GPOUT,155)
    out_l_grpid_08 <= l_grpid_08_mux_q;

    -- l_grpid_0_addr13_mux(MUX,130)
    l_grpid_0_addr13_mux_s <= priority_encoder_out_o_select;
    l_grpid_0_addr13_mux_combproc: PROCESS (l_grpid_0_addr13_mux_s, in_l_grpid_0_addr13_0, in_l_grpid_0_addr13_1)
    BEGIN
        CASE (l_grpid_0_addr13_mux_s) IS
            WHEN "0" => l_grpid_0_addr13_mux_q <= in_l_grpid_0_addr13_0;
            WHEN "1" => l_grpid_0_addr13_mux_q <= in_l_grpid_0_addr13_1;
            WHEN OTHERS => l_grpid_0_addr13_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_0_addr13(GPOUT,156)
    out_l_grpid_0_addr13 <= l_grpid_0_addr13_mux_q;

    -- r_0_i_ph_mux(MUX,186)
    r_0_i_ph_mux_s <= priority_encoder_out_o_select;
    r_0_i_ph_mux_combproc: PROCESS (r_0_i_ph_mux_s, in_r_0_i_ph_0, in_r_0_i_ph_1)
    BEGIN
        CASE (r_0_i_ph_mux_s) IS
            WHEN "0" => r_0_i_ph_mux_q <= in_r_0_i_ph_0;
            WHEN "1" => r_0_i_ph_mux_q <= in_r_0_i_ph_1;
            WHEN OTHERS => r_0_i_ph_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_r_0_i_ph(GPOUT,157)
    out_r_0_i_ph <= r_0_i_ph_mux_q;

    -- scalarizer_0_mux(MUX,198)
    scalarizer_0_mux_s <= priority_encoder_out_o_select;
    scalarizer_0_mux_combproc: PROCESS (scalarizer_0_mux_s, in_scalarizer_0_0, in_scalarizer_0_1)
    BEGIN
        CASE (scalarizer_0_mux_s) IS
            WHEN "0" => scalarizer_0_mux_q <= in_scalarizer_0_0;
            WHEN "1" => scalarizer_0_mux_q <= in_scalarizer_0_1;
            WHEN OTHERS => scalarizer_0_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0(GPOUT,158)
    out_scalarizer_0 <= scalarizer_0_mux_q;

    -- scalarizer_01001_mux(MUX,187)
    scalarizer_01001_mux_s <= priority_encoder_out_o_select;
    scalarizer_01001_mux_combproc: PROCESS (scalarizer_01001_mux_s, in_scalarizer_01001_0, in_scalarizer_01001_1)
    BEGIN
        CASE (scalarizer_01001_mux_s) IS
            WHEN "0" => scalarizer_01001_mux_q <= in_scalarizer_01001_0;
            WHEN "1" => scalarizer_01001_mux_q <= in_scalarizer_01001_1;
            WHEN OTHERS => scalarizer_01001_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01001(GPOUT,159)
    out_scalarizer_01001 <= scalarizer_01001_mux_q;

    -- scalarizer_01003_mux(MUX,188)
    scalarizer_01003_mux_s <= priority_encoder_out_o_select;
    scalarizer_01003_mux_combproc: PROCESS (scalarizer_01003_mux_s, in_scalarizer_01003_0, in_scalarizer_01003_1)
    BEGIN
        CASE (scalarizer_01003_mux_s) IS
            WHEN "0" => scalarizer_01003_mux_q <= in_scalarizer_01003_0;
            WHEN "1" => scalarizer_01003_mux_q <= in_scalarizer_01003_1;
            WHEN OTHERS => scalarizer_01003_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01003(GPOUT,160)
    out_scalarizer_01003 <= scalarizer_01003_mux_q;

    -- scalarizer_01005_mux(MUX,189)
    scalarizer_01005_mux_s <= priority_encoder_out_o_select;
    scalarizer_01005_mux_combproc: PROCESS (scalarizer_01005_mux_s, in_scalarizer_01005_0, in_scalarizer_01005_1)
    BEGIN
        CASE (scalarizer_01005_mux_s) IS
            WHEN "0" => scalarizer_01005_mux_q <= in_scalarizer_01005_0;
            WHEN "1" => scalarizer_01005_mux_q <= in_scalarizer_01005_1;
            WHEN OTHERS => scalarizer_01005_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01005(GPOUT,161)
    out_scalarizer_01005 <= scalarizer_01005_mux_q;

    -- scalarizer_01007_mux(MUX,190)
    scalarizer_01007_mux_s <= priority_encoder_out_o_select;
    scalarizer_01007_mux_combproc: PROCESS (scalarizer_01007_mux_s, in_scalarizer_01007_0, in_scalarizer_01007_1)
    BEGIN
        CASE (scalarizer_01007_mux_s) IS
            WHEN "0" => scalarizer_01007_mux_q <= in_scalarizer_01007_0;
            WHEN "1" => scalarizer_01007_mux_q <= in_scalarizer_01007_1;
            WHEN OTHERS => scalarizer_01007_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01007(GPOUT,162)
    out_scalarizer_01007 <= scalarizer_01007_mux_q;

    -- scalarizer_0987_mux(MUX,191)
    scalarizer_0987_mux_s <= priority_encoder_out_o_select;
    scalarizer_0987_mux_combproc: PROCESS (scalarizer_0987_mux_s, in_scalarizer_0987_0, in_scalarizer_0987_1)
    BEGIN
        CASE (scalarizer_0987_mux_s) IS
            WHEN "0" => scalarizer_0987_mux_q <= in_scalarizer_0987_0;
            WHEN "1" => scalarizer_0987_mux_q <= in_scalarizer_0987_1;
            WHEN OTHERS => scalarizer_0987_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0987(GPOUT,163)
    out_scalarizer_0987 <= scalarizer_0987_mux_q;

    -- scalarizer_0989_mux(MUX,192)
    scalarizer_0989_mux_s <= priority_encoder_out_o_select;
    scalarizer_0989_mux_combproc: PROCESS (scalarizer_0989_mux_s, in_scalarizer_0989_0, in_scalarizer_0989_1)
    BEGIN
        CASE (scalarizer_0989_mux_s) IS
            WHEN "0" => scalarizer_0989_mux_q <= in_scalarizer_0989_0;
            WHEN "1" => scalarizer_0989_mux_q <= in_scalarizer_0989_1;
            WHEN OTHERS => scalarizer_0989_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0989(GPOUT,164)
    out_scalarizer_0989 <= scalarizer_0989_mux_q;

    -- scalarizer_0991_mux(MUX,193)
    scalarizer_0991_mux_s <= priority_encoder_out_o_select;
    scalarizer_0991_mux_combproc: PROCESS (scalarizer_0991_mux_s, in_scalarizer_0991_0, in_scalarizer_0991_1)
    BEGIN
        CASE (scalarizer_0991_mux_s) IS
            WHEN "0" => scalarizer_0991_mux_q <= in_scalarizer_0991_0;
            WHEN "1" => scalarizer_0991_mux_q <= in_scalarizer_0991_1;
            WHEN OTHERS => scalarizer_0991_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0991(GPOUT,165)
    out_scalarizer_0991 <= scalarizer_0991_mux_q;

    -- scalarizer_0993_mux(MUX,194)
    scalarizer_0993_mux_s <= priority_encoder_out_o_select;
    scalarizer_0993_mux_combproc: PROCESS (scalarizer_0993_mux_s, in_scalarizer_0993_0, in_scalarizer_0993_1)
    BEGIN
        CASE (scalarizer_0993_mux_s) IS
            WHEN "0" => scalarizer_0993_mux_q <= in_scalarizer_0993_0;
            WHEN "1" => scalarizer_0993_mux_q <= in_scalarizer_0993_1;
            WHEN OTHERS => scalarizer_0993_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0993(GPOUT,166)
    out_scalarizer_0993 <= scalarizer_0993_mux_q;

    -- scalarizer_0995_mux(MUX,195)
    scalarizer_0995_mux_s <= priority_encoder_out_o_select;
    scalarizer_0995_mux_combproc: PROCESS (scalarizer_0995_mux_s, in_scalarizer_0995_0, in_scalarizer_0995_1)
    BEGIN
        CASE (scalarizer_0995_mux_s) IS
            WHEN "0" => scalarizer_0995_mux_q <= in_scalarizer_0995_0;
            WHEN "1" => scalarizer_0995_mux_q <= in_scalarizer_0995_1;
            WHEN OTHERS => scalarizer_0995_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0995(GPOUT,167)
    out_scalarizer_0995 <= scalarizer_0995_mux_q;

    -- scalarizer_0997_mux(MUX,196)
    scalarizer_0997_mux_s <= priority_encoder_out_o_select;
    scalarizer_0997_mux_combproc: PROCESS (scalarizer_0997_mux_s, in_scalarizer_0997_0, in_scalarizer_0997_1)
    BEGIN
        CASE (scalarizer_0997_mux_s) IS
            WHEN "0" => scalarizer_0997_mux_q <= in_scalarizer_0997_0;
            WHEN "1" => scalarizer_0997_mux_q <= in_scalarizer_0997_1;
            WHEN OTHERS => scalarizer_0997_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0997(GPOUT,168)
    out_scalarizer_0997 <= scalarizer_0997_mux_q;

    -- scalarizer_0999_mux(MUX,197)
    scalarizer_0999_mux_s <= priority_encoder_out_o_select;
    scalarizer_0999_mux_combproc: PROCESS (scalarizer_0999_mux_s, in_scalarizer_0999_0, in_scalarizer_0999_1)
    BEGIN
        CASE (scalarizer_0999_mux_s) IS
            WHEN "0" => scalarizer_0999_mux_q <= in_scalarizer_0999_0;
            WHEN "1" => scalarizer_0999_mux_q <= in_scalarizer_0999_1;
            WHEN OTHERS => scalarizer_0999_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0999(GPOUT,169)
    out_scalarizer_0999 <= scalarizer_0999_mux_q;

    -- scalarizer_1_mux(MUX,210)
    scalarizer_1_mux_s <= priority_encoder_out_o_select;
    scalarizer_1_mux_combproc: PROCESS (scalarizer_1_mux_s, in_scalarizer_1_0, in_scalarizer_1_1)
    BEGIN
        CASE (scalarizer_1_mux_s) IS
            WHEN "0" => scalarizer_1_mux_q <= in_scalarizer_1_0;
            WHEN "1" => scalarizer_1_mux_q <= in_scalarizer_1_1;
            WHEN OTHERS => scalarizer_1_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1(GPOUT,170)
    out_scalarizer_1 <= scalarizer_1_mux_q;

    -- scalarizer_11000_mux(MUX,199)
    scalarizer_11000_mux_s <= priority_encoder_out_o_select;
    scalarizer_11000_mux_combproc: PROCESS (scalarizer_11000_mux_s, in_scalarizer_11000_0, in_scalarizer_11000_1)
    BEGIN
        CASE (scalarizer_11000_mux_s) IS
            WHEN "0" => scalarizer_11000_mux_q <= in_scalarizer_11000_0;
            WHEN "1" => scalarizer_11000_mux_q <= in_scalarizer_11000_1;
            WHEN OTHERS => scalarizer_11000_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11000(GPOUT,171)
    out_scalarizer_11000 <= scalarizer_11000_mux_q;

    -- scalarizer_11002_mux(MUX,200)
    scalarizer_11002_mux_s <= priority_encoder_out_o_select;
    scalarizer_11002_mux_combproc: PROCESS (scalarizer_11002_mux_s, in_scalarizer_11002_0, in_scalarizer_11002_1)
    BEGIN
        CASE (scalarizer_11002_mux_s) IS
            WHEN "0" => scalarizer_11002_mux_q <= in_scalarizer_11002_0;
            WHEN "1" => scalarizer_11002_mux_q <= in_scalarizer_11002_1;
            WHEN OTHERS => scalarizer_11002_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11002(GPOUT,172)
    out_scalarizer_11002 <= scalarizer_11002_mux_q;

    -- scalarizer_11004_mux(MUX,201)
    scalarizer_11004_mux_s <= priority_encoder_out_o_select;
    scalarizer_11004_mux_combproc: PROCESS (scalarizer_11004_mux_s, in_scalarizer_11004_0, in_scalarizer_11004_1)
    BEGIN
        CASE (scalarizer_11004_mux_s) IS
            WHEN "0" => scalarizer_11004_mux_q <= in_scalarizer_11004_0;
            WHEN "1" => scalarizer_11004_mux_q <= in_scalarizer_11004_1;
            WHEN OTHERS => scalarizer_11004_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11004(GPOUT,173)
    out_scalarizer_11004 <= scalarizer_11004_mux_q;

    -- scalarizer_11006_mux(MUX,202)
    scalarizer_11006_mux_s <= priority_encoder_out_o_select;
    scalarizer_11006_mux_combproc: PROCESS (scalarizer_11006_mux_s, in_scalarizer_11006_0, in_scalarizer_11006_1)
    BEGIN
        CASE (scalarizer_11006_mux_s) IS
            WHEN "0" => scalarizer_11006_mux_q <= in_scalarizer_11006_0;
            WHEN "1" => scalarizer_11006_mux_q <= in_scalarizer_11006_1;
            WHEN OTHERS => scalarizer_11006_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11006(GPOUT,174)
    out_scalarizer_11006 <= scalarizer_11006_mux_q;

    -- scalarizer_11008_mux(MUX,203)
    scalarizer_11008_mux_s <= priority_encoder_out_o_select;
    scalarizer_11008_mux_combproc: PROCESS (scalarizer_11008_mux_s, in_scalarizer_11008_0, in_scalarizer_11008_1)
    BEGIN
        CASE (scalarizer_11008_mux_s) IS
            WHEN "0" => scalarizer_11008_mux_q <= in_scalarizer_11008_0;
            WHEN "1" => scalarizer_11008_mux_q <= in_scalarizer_11008_1;
            WHEN OTHERS => scalarizer_11008_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11008(GPOUT,175)
    out_scalarizer_11008 <= scalarizer_11008_mux_q;

    -- scalarizer_1988_mux(MUX,204)
    scalarizer_1988_mux_s <= priority_encoder_out_o_select;
    scalarizer_1988_mux_combproc: PROCESS (scalarizer_1988_mux_s, in_scalarizer_1988_0, in_scalarizer_1988_1)
    BEGIN
        CASE (scalarizer_1988_mux_s) IS
            WHEN "0" => scalarizer_1988_mux_q <= in_scalarizer_1988_0;
            WHEN "1" => scalarizer_1988_mux_q <= in_scalarizer_1988_1;
            WHEN OTHERS => scalarizer_1988_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1988(GPOUT,176)
    out_scalarizer_1988 <= scalarizer_1988_mux_q;

    -- scalarizer_1990_mux(MUX,205)
    scalarizer_1990_mux_s <= priority_encoder_out_o_select;
    scalarizer_1990_mux_combproc: PROCESS (scalarizer_1990_mux_s, in_scalarizer_1990_0, in_scalarizer_1990_1)
    BEGIN
        CASE (scalarizer_1990_mux_s) IS
            WHEN "0" => scalarizer_1990_mux_q <= in_scalarizer_1990_0;
            WHEN "1" => scalarizer_1990_mux_q <= in_scalarizer_1990_1;
            WHEN OTHERS => scalarizer_1990_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1990(GPOUT,177)
    out_scalarizer_1990 <= scalarizer_1990_mux_q;

    -- scalarizer_1992_mux(MUX,206)
    scalarizer_1992_mux_s <= priority_encoder_out_o_select;
    scalarizer_1992_mux_combproc: PROCESS (scalarizer_1992_mux_s, in_scalarizer_1992_0, in_scalarizer_1992_1)
    BEGIN
        CASE (scalarizer_1992_mux_s) IS
            WHEN "0" => scalarizer_1992_mux_q <= in_scalarizer_1992_0;
            WHEN "1" => scalarizer_1992_mux_q <= in_scalarizer_1992_1;
            WHEN OTHERS => scalarizer_1992_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1992(GPOUT,178)
    out_scalarizer_1992 <= scalarizer_1992_mux_q;

    -- scalarizer_1994_mux(MUX,207)
    scalarizer_1994_mux_s <= priority_encoder_out_o_select;
    scalarizer_1994_mux_combproc: PROCESS (scalarizer_1994_mux_s, in_scalarizer_1994_0, in_scalarizer_1994_1)
    BEGIN
        CASE (scalarizer_1994_mux_s) IS
            WHEN "0" => scalarizer_1994_mux_q <= in_scalarizer_1994_0;
            WHEN "1" => scalarizer_1994_mux_q <= in_scalarizer_1994_1;
            WHEN OTHERS => scalarizer_1994_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1994(GPOUT,179)
    out_scalarizer_1994 <= scalarizer_1994_mux_q;

    -- scalarizer_1996_mux(MUX,208)
    scalarizer_1996_mux_s <= priority_encoder_out_o_select;
    scalarizer_1996_mux_combproc: PROCESS (scalarizer_1996_mux_s, in_scalarizer_1996_0, in_scalarizer_1996_1)
    BEGIN
        CASE (scalarizer_1996_mux_s) IS
            WHEN "0" => scalarizer_1996_mux_q <= in_scalarizer_1996_0;
            WHEN "1" => scalarizer_1996_mux_q <= in_scalarizer_1996_1;
            WHEN OTHERS => scalarizer_1996_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1996(GPOUT,180)
    out_scalarizer_1996 <= scalarizer_1996_mux_q;

    -- scalarizer_1998_mux(MUX,209)
    scalarizer_1998_mux_s <= priority_encoder_out_o_select;
    scalarizer_1998_mux_combproc: PROCESS (scalarizer_1998_mux_s, in_scalarizer_1998_0, in_scalarizer_1998_1)
    BEGIN
        CASE (scalarizer_1998_mux_s) IS
            WHEN "0" => scalarizer_1998_mux_q <= in_scalarizer_1998_0;
            WHEN "1" => scalarizer_1998_mux_q <= in_scalarizer_1998_1;
            WHEN OTHERS => scalarizer_1998_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1998(GPOUT,181)
    out_scalarizer_1998 <= scalarizer_1998_mux_q;

    -- stall_out_0_specific(LOGICAL,211)
    stall_out_0_specific_q <= in_stall_in or priority_encoder_out_o_select;

    -- out_stall_out_0(GPOUT,182)
    out_stall_out_0 <= stall_out_0_specific_q;

    -- not_select(LOGICAL,131)
    not_select_q <= not (priority_encoder_out_o_select);

    -- stall_out_1_specific(LOGICAL,212)
    stall_out_1_specific_q <= in_stall_in or not_select_q;

    -- out_stall_out_1(GPOUT,183)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- out_valid_out(GPOUT,184)
    out_valid_out <= priority_encoder_out_o_valid;

END normal;
