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

-- VHDL created from bb_ethash_search_B7_stall_region
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

entity bb_ethash_search_B7_stall_region is
    port (
        in_arrayidx12_i_i19695 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx14_i_i21752 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx16_i_i23701 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx22_i_i28756 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx24_i_i30712 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx26_i_i32715 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx2_i_i10684 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30_i_i35720 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx32_i_i37723 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx34_i_i39726 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_i_i41729 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx40_i_i44734 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx42_i_i46737 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx44_i_i48740 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx46_i_i50743 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx4_i_i12686 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx6_i_i14688 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe1102 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv : in std_logic_vector(5 downto 0);  -- ufix6
        in_global_id_0191 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02 : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i1_ph : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01218 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01220 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01222 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01224 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01226 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01228 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01230 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01232 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11219 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11221 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11223 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11225 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11227 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11229 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11231 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11233 : in std_logic_vector(31 downto 0);  -- ufix32
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
        out_c0_exe36188 : out std_logic_vector(0 downto 0);  -- ufix1
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
        out_state_10_2_cast185 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_11_2_cast187 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_8_2_cast181 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_9_2_cast183 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B7_stall_region;

architecture normal of bb_ethash_search_B7_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_search_B7_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_37 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_38 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search is
        port (
            in_c0_eni3678_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3678_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_c0_eni3678_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3678_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_15 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_16 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3678_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3678_36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit152_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit152_1 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exit152_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_20 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit152_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit152_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_data_out_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_1 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_18 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_19 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_20 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_21 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_22 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_23 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_ethash_search_B7_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (1958 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_s : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_t : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_u : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_v : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_w : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_x : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_y : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_z : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_aa : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_bb : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_cc : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_dd : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_ee : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_ff : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_gg : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_hh : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_ii : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_kk : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_ll : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_mm : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_nn : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_oo : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_pp : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B7_merge_reg_aunroll_x_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (1638 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_s : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_t : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_u : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_v : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_w : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_x : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_y : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_z : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_aa : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_bb : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_cc : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_dd : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ee : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ff : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_gg : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_hh : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ii : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_kk : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (1958 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_n : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_o : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_p : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_r : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_t : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_stall_entry_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ee : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ff : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_gg : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_hh : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ii : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_kk : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ll : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_nn : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_oo : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_pp : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_qq : STD_LOGIC_VECTOR (63 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B7_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,77)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= ethash_search_B7_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,70)
    bubble_join_stall_entry_q <= in_state_9_2_cast183 & in_state_8_2_cast181 & in_state_11_2_cast187 & in_state_10_2_cast185 & in_scalarizer_11233 & in_scalarizer_11231 & in_scalarizer_11229 & in_scalarizer_11227 & in_scalarizer_11225 & in_scalarizer_11223 & in_scalarizer_11221 & in_scalarizer_11219 & in_scalarizer_01232 & in_scalarizer_01230 & in_scalarizer_01228 & in_scalarizer_01226 & in_scalarizer_01224 & in_scalarizer_01222 & in_scalarizer_01220 & in_scalarizer_01218 & in_r_0_i1_ph & in_l_grpid_02 & in_global_id_0191 & in_fpgaindvars_iv & in_c0_exe1102 & in_arrayidx6_i_i14688 & in_arrayidx4_i_i12686 & in_arrayidx46_i_i50743 & in_arrayidx44_i_i48740 & in_arrayidx42_i_i46737 & in_arrayidx40_i_i44734 & in_arrayidx36_i_i41729 & in_arrayidx34_i_i39726 & in_arrayidx32_i_i37723 & in_arrayidx30_i_i35720 & in_arrayidx2_i_i10684 & in_arrayidx26_i_i32715 & in_arrayidx24_i_i30712 & in_arrayidx22_i_i28756 & in_arrayidx16_i_i23701 & in_arrayidx14_i_i21752 & in_arrayidx12_i_i19695;

    -- bubble_select_stall_entry(BITSELECT,71)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 192));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(319 downto 256));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(383 downto 320));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(447 downto 384));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(511 downto 448));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(575 downto 512));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(639 downto 576));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(703 downto 640));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(767 downto 704));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(831 downto 768));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(895 downto 832));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(959 downto 896));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1023 downto 960));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1087 downto 1024));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1088 downto 1088));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1094 downto 1089));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1126 downto 1095));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1158 downto 1127));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1190 downto 1159));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1222 downto 1191));
    bubble_select_stall_entry_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1254 downto 1223));
    bubble_select_stall_entry_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1286 downto 1255));
    bubble_select_stall_entry_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1318 downto 1287));
    bubble_select_stall_entry_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1350 downto 1319));
    bubble_select_stall_entry_cc <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1382 downto 1351));
    bubble_select_stall_entry_dd <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1414 downto 1383));
    bubble_select_stall_entry_ee <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1446 downto 1415));
    bubble_select_stall_entry_ff <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1478 downto 1447));
    bubble_select_stall_entry_gg <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1510 downto 1479));
    bubble_select_stall_entry_hh <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1542 downto 1511));
    bubble_select_stall_entry_ii <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1574 downto 1543));
    bubble_select_stall_entry_jj <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1606 downto 1575));
    bubble_select_stall_entry_kk <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1638 downto 1607));
    bubble_select_stall_entry_ll <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1670 downto 1639));
    bubble_select_stall_entry_mm <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1702 downto 1671));
    bubble_select_stall_entry_nn <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1766 downto 1703));
    bubble_select_stall_entry_oo <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1830 downto 1767));
    bubble_select_stall_entry_pp <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1894 downto 1831));
    bubble_select_stall_entry_qq <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1958 downto 1895));

    -- ethash_search_B7_merge_reg_aunroll_x(BLACKBOX,6)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_data_out_9@1
    -- out out_data_out_10@1
    -- out out_data_out_11@1
    -- out out_data_out_12@1
    -- out out_data_out_13@1
    -- out out_data_out_14@1
    -- out out_data_out_15@1
    -- out out_data_out_16@1
    -- out out_data_out_17@1
    -- out out_data_out_18@1
    -- out out_data_out_19@1
    -- out out_data_out_20@1
    -- out out_data_out_21@1
    -- out out_data_out_22@1
    -- out out_data_out_23@1
    -- out out_data_out_24@1
    -- out out_data_out_25@1
    -- out out_data_out_26@1
    -- out out_data_out_27@1
    -- out out_data_out_28@1
    -- out out_data_out_29@1
    -- out out_data_out_30@1
    -- out out_data_out_31@1
    -- out out_data_out_32@1
    -- out out_data_out_33@1
    -- out out_data_out_34@1
    -- out out_data_out_35@1
    -- out out_data_out_36@1
    -- out out_data_out_37@1
    -- out out_data_out_38@1
    -- out out_data_out_39@1
    -- out out_data_out_40@1
    -- out out_data_out_41@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theethash_search_B7_merge_reg_aunroll_x : ethash_search_B7_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_t,
        in_data_in_1 => bubble_select_stall_entry_x,
        in_data_in_2 => bubble_select_stall_entry_ff,
        in_data_in_3 => bubble_select_stall_entry_y,
        in_data_in_4 => bubble_select_stall_entry_gg,
        in_data_in_5 => bubble_select_stall_entry_z,
        in_data_in_6 => bubble_select_stall_entry_hh,
        in_data_in_7 => bubble_select_stall_entry_aa,
        in_data_in_8 => bubble_select_stall_entry_ii,
        in_data_in_9 => bubble_select_stall_entry_bb,
        in_data_in_10 => bubble_select_stall_entry_jj,
        in_data_in_11 => bubble_select_stall_entry_cc,
        in_data_in_12 => bubble_select_stall_entry_kk,
        in_data_in_13 => bubble_select_stall_entry_dd,
        in_data_in_14 => bubble_select_stall_entry_ll,
        in_data_in_15 => bubble_select_stall_entry_ee,
        in_data_in_16 => bubble_select_stall_entry_mm,
        in_data_in_17 => bubble_select_stall_entry_p,
        in_data_in_18 => bubble_select_stall_entry_o,
        in_data_in_19 => bubble_select_stall_entry_n,
        in_data_in_20 => bubble_select_stall_entry_m,
        in_data_in_21 => bubble_select_stall_entry_l,
        in_data_in_22 => bubble_select_stall_entry_k,
        in_data_in_23 => bubble_select_stall_entry_j,
        in_data_in_24 => bubble_select_stall_entry_i,
        in_data_in_25 => bubble_select_stall_entry_g,
        in_data_in_26 => bubble_select_stall_entry_f,
        in_data_in_27 => bubble_select_stall_entry_d,
        in_data_in_28 => bubble_select_stall_entry_b,
        in_data_in_29 => bubble_select_stall_entry_r,
        in_data_in_30 => bubble_select_stall_entry_q,
        in_data_in_31 => bubble_select_stall_entry_h,
        in_data_in_32 => bubble_select_stall_entry_e,
        in_data_in_33 => bubble_select_stall_entry_c,
        in_data_in_34 => bubble_select_stall_entry_w,
        in_data_in_35 => bubble_select_stall_entry_v,
        in_data_in_36 => bubble_select_stall_entry_s,
        in_data_in_37 => bubble_select_stall_entry_pp,
        in_data_in_38 => bubble_select_stall_entry_qq,
        in_data_in_39 => bubble_select_stall_entry_nn,
        in_data_in_40 => bubble_select_stall_entry_oo,
        in_data_in_41 => bubble_select_stall_entry_u,
        in_stall_in => SE_out_ethash_search_B7_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_11,
        out_data_out_12 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_12,
        out_data_out_13 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_13,
        out_data_out_14 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_14,
        out_data_out_15 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_15,
        out_data_out_16 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_16,
        out_data_out_17 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_17,
        out_data_out_18 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_18,
        out_data_out_19 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_19,
        out_data_out_20 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_20,
        out_data_out_21 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_21,
        out_data_out_22 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_22,
        out_data_out_23 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_23,
        out_data_out_24 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_24,
        out_data_out_25 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_25,
        out_data_out_26 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_26,
        out_data_out_27 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_27,
        out_data_out_28 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_28,
        out_data_out_29 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_29,
        out_data_out_30 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_30,
        out_data_out_31 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_31,
        out_data_out_32 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_32,
        out_data_out_33 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_33,
        out_data_out_34 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_34,
        out_data_out_35 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_35,
        out_data_out_36 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_36,
        out_data_out_37 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_37,
        out_data_out_38 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_38,
        out_data_out_39 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_39,
        out_data_out_40 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_40,
        out_data_out_41 => ethash_search_B7_merge_reg_aunroll_x_out_data_out_41,
        out_stall_out => ethash_search_B7_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => ethash_search_B7_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_ethash_search_B7_merge_reg_aunroll_x(STALLENABLE,74)
    SE_out_ethash_search_B7_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg0 <= SE_out_ethash_search_B7_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg1 <= SE_out_ethash_search_B7_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_ethash_search_B7_merge_reg_aunroll_x_consumed0 <= (not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backStall) and SE_out_ethash_search_B7_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg0;
    SE_out_ethash_search_B7_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_o_stall) and SE_out_ethash_search_B7_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_ethash_search_B7_merge_reg_aunroll_x_StallValid <= SE_out_ethash_search_B7_merge_reg_aunroll_x_backStall and SE_out_ethash_search_B7_merge_reg_aunroll_x_wireValid;
    SE_out_ethash_search_B7_merge_reg_aunroll_x_toReg0 <= SE_out_ethash_search_B7_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B7_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_search_B7_merge_reg_aunroll_x_toReg1 <= SE_out_ethash_search_B7_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B7_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_ethash_search_B7_merge_reg_aunroll_x_or0 <= SE_out_ethash_search_B7_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_search_B7_merge_reg_aunroll_x_wireStall <= not (SE_out_ethash_search_B7_merge_reg_aunroll_x_consumed1 and SE_out_ethash_search_B7_merge_reg_aunroll_x_or0);
    SE_out_ethash_search_B7_merge_reg_aunroll_x_backStall <= SE_out_ethash_search_B7_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_ethash_search_B7_merge_reg_aunroll_x_V0 <= SE_out_ethash_search_B7_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg0);
    SE_out_ethash_search_B7_merge_reg_aunroll_x_V1 <= SE_out_ethash_search_B7_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B7_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_ethash_search_B7_merge_reg_aunroll_x_wireValid <= ethash_search_B7_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0(STALLENABLE,79)
    -- Valid signal propagation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_V0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_s_tv_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backStall and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN <= not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_v_s_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN and SE_out_ethash_search_B7_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backStall <= not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_v_s_0);
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "0") THEN
                SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_R_v_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_R_v_0 and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_s_tv_0;
            ELSE
                SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_R_v_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1(STALLENABLE,80)
    -- Valid signal propagation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_V0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_s_tv_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backStall and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN <= not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_v_s_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_V0;
    -- Backward Stall generation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backStall <= not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_v_s_0);
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "0") THEN
                SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_R_v_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_R_v_0 and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_s_tv_0;
            ELSE
                SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_R_v_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2(STALLENABLE,81)
    -- Valid signal propagation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_V0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_s_tv_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backStall and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN <= not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_v_s_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_V0;
    -- Backward Stall generation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backStall <= not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_v_s_0);
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "0") THEN
                SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_R_v_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_R_v_0 and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_s_tv_0;
            ELSE
                SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_R_v_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3(STALLENABLE,82)
    -- Valid signal propagation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_V0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_s_tv_0 <= SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_backStall and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN <= not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_v_s_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_V0;
    -- Backward Stall generation
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backStall <= not (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_v_s_0);
    SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "0") THEN
                SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_R_v_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_R_v_0 and SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_s_tv_0;
            ELSE
                SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_R_v_0 <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_ethash_search_B7_merge_reg_aunroll_x(BITJOIN,63)
    bubble_join_ethash_search_B7_merge_reg_aunroll_x_q <= ethash_search_B7_merge_reg_aunroll_x_out_data_out_41 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_40 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_39 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_38 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_37 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_36 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_35 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_34 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_33 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_32 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_31 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_30 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_29 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_28 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_27 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_26 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_25 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_24 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_23 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_22 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_21 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_20 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_19 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_18 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_17 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_16 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_15 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_14 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_13 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_12 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_11 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_10 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_9 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_8 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_7 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_6 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_5 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_4 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_3 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_2 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_1 & ethash_search_B7_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_ethash_search_B7_merge_reg_aunroll_x(BITSELECT,64)
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(5 downto 0));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(37 downto 6));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(69 downto 38));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(101 downto 70));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(133 downto 102));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(165 downto 134));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(197 downto 166));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(229 downto 198));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(261 downto 230));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(293 downto 262));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(325 downto 294));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(357 downto 326));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(389 downto 358));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(421 downto 390));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(453 downto 422));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(485 downto 454));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(517 downto 486));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(581 downto 518));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(645 downto 582));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(709 downto 646));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(773 downto 710));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(837 downto 774));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(901 downto 838));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(965 downto 902));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1029 downto 966));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1093 downto 1030));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1157 downto 1094));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1221 downto 1158));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1285 downto 1222));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_ee <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1349 downto 1286));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_ff <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1413 downto 1350));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_gg <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1477 downto 1414));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_hh <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1541 downto 1478));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_ii <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1605 downto 1542));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_jj <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1637 downto 1606));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_kk <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1669 downto 1638));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_ll <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1670 downto 1670));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_mm <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1734 downto 1671));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_nn <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1798 downto 1735));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_oo <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1862 downto 1799));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_pp <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1926 downto 1863));
    bubble_select_ethash_search_B7_merge_reg_aunroll_x_qq <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B7_merge_reg_aunroll_x_q(1958 downto 1927));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x(BLACKBOX,7)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit152_0@5
    -- out out_c0_exit152_1@5
    -- out out_c0_exit152_2@5
    -- out out_c0_exit152_3@5
    -- out out_c0_exit152_4@5
    -- out out_c0_exit152_5@5
    -- out out_c0_exit152_6@5
    -- out out_c0_exit152_7@5
    -- out out_c0_exit152_8@5
    -- out out_c0_exit152_9@5
    -- out out_c0_exit152_10@5
    -- out out_c0_exit152_11@5
    -- out out_c0_exit152_12@5
    -- out out_c0_exit152_13@5
    -- out out_c0_exit152_14@5
    -- out out_c0_exit152_15@5
    -- out out_c0_exit152_16@5
    -- out out_c0_exit152_17@5
    -- out out_c0_exit152_18@5
    -- out out_c0_exit152_19@5
    -- out out_c0_exit152_20@5
    -- out out_c0_exit152_21@5
    -- out out_c0_exit152_22@5
    -- out out_c0_exit152_23@5
    -- out out_c0_exit152_24@5
    -- out out_c0_exit152_25@5
    -- out out_c0_exit152_26@5
    -- out out_c0_exit152_27@5
    -- out out_c0_exit152_28@5
    -- out out_c0_exit152_29@5
    -- out out_c0_exit152_30@5
    -- out out_c0_exit152_31@5
    -- out out_c0_exit152_32@5
    -- out out_c0_exit152_33@5
    -- out out_c0_exit152_34@5
    -- out out_c0_exit152_35@5
    -- out out_c0_exit152_36@5
    -- out out_o_stall@20000000
    -- out out_o_valid@5
    thei_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x : i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search
    PORT MAP (
        in_c0_eni3678_0 => GND_q,
        in_c0_eni3678_1 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_b,
        in_c0_eni3678_2 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_jj,
        in_c0_eni3678_3 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_ll,
        in_c0_eni3678_4 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_gg,
        in_c0_eni3678_5 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_ff,
        in_c0_eni3678_6 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_ee,
        in_c0_eni3678_7 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_q,
        in_c0_eni3678_8 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_g,
        in_c0_eni3678_9 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_r,
        in_c0_eni3678_10 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_h,
        in_c0_eni3678_11 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_o,
        in_c0_eni3678_12 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_p,
        in_c0_eni3678_13 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_e,
        in_c0_eni3678_14 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_f,
        in_c0_eni3678_15 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_dd,
        in_c0_eni3678_16 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_ii,
        in_c0_eni3678_17 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_cc,
        in_c0_eni3678_18 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_m,
        in_c0_eni3678_19 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_n,
        in_c0_eni3678_20 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_c,
        in_c0_eni3678_21 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_d,
        in_c0_eni3678_22 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_hh,
        in_c0_eni3678_23 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_bb,
        in_c0_eni3678_24 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_aa,
        in_c0_eni3678_25 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_k,
        in_c0_eni3678_26 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_l,
        in_c0_eni3678_27 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_z,
        in_c0_eni3678_28 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_y,
        in_c0_eni3678_29 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_x,
        in_c0_eni3678_30 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_w,
        in_c0_eni3678_31 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_i,
        in_c0_eni3678_32 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_j,
        in_c0_eni3678_33 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_v,
        in_c0_eni3678_34 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_u,
        in_c0_eni3678_35 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_t,
        in_c0_eni3678_36 => bubble_select_ethash_search_B7_merge_reg_aunroll_x_s,
        in_i_stall => SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_backStall,
        in_i_valid => SE_out_ethash_search_B7_merge_reg_aunroll_x_V1,
        out_c0_exit152_1 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_1,
        out_c0_exit152_2 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_2,
        out_c0_exit152_3 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_3,
        out_c0_exit152_4 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_4,
        out_c0_exit152_5 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_5,
        out_c0_exit152_6 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_6,
        out_c0_exit152_7 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_7,
        out_c0_exit152_8 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_8,
        out_c0_exit152_9 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_9,
        out_c0_exit152_10 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_10,
        out_c0_exit152_11 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_11,
        out_c0_exit152_12 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_12,
        out_c0_exit152_13 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_13,
        out_c0_exit152_14 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_14,
        out_c0_exit152_15 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_15,
        out_c0_exit152_16 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_16,
        out_c0_exit152_17 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_17,
        out_c0_exit152_18 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_18,
        out_c0_exit152_19 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_19,
        out_c0_exit152_20 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_20,
        out_c0_exit152_21 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_21,
        out_c0_exit152_22 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_22,
        out_c0_exit152_23 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_23,
        out_c0_exit152_24 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_24,
        out_c0_exit152_25 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_25,
        out_c0_exit152_26 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_26,
        out_c0_exit152_27 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_27,
        out_c0_exit152_28 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_28,
        out_c0_exit152_29 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_29,
        out_c0_exit152_30 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_30,
        out_c0_exit152_31 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_31,
        out_c0_exit152_32 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_32,
        out_c0_exit152_33 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_33,
        out_c0_exit152_34 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_34,
        out_c0_exit152_35 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_35,
        out_c0_exit152_36 => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_36,
        out_o_stall => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x(STALLENABLE,76)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_V0 <= SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_backStall <= in_stall_in or not (SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_and0 <= i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_wireValid <= SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_V0 and SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_and0;

    -- redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_0(REG,46)
    redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_nn);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_1(REG,47)
    redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_1_q <= STD_LOGIC_VECTOR(redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_2(REG,48)
    redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_2_q <= STD_LOGIC_VECTOR(redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_3(REG,49)
    redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_3_q <= STD_LOGIC_VECTOR(redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_0(REG,42)
    redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_mm);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_1(REG,43)
    redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_1_q <= STD_LOGIC_VECTOR(redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_2(REG,44)
    redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_2_q <= STD_LOGIC_VECTOR(redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_3(REG,45)
    redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_3_q <= STD_LOGIC_VECTOR(redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_0(REG,54)
    redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_pp);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_1(REG,55)
    redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_1_q <= STD_LOGIC_VECTOR(redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_2(REG,56)
    redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_2_q <= STD_LOGIC_VECTOR(redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_3(REG,57)
    redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_3_q <= STD_LOGIC_VECTOR(redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_0(REG,50)
    redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_oo);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_1(REG,51)
    redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_1_q <= STD_LOGIC_VECTOR(redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_2(REG,52)
    redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_2_q <= STD_LOGIC_VECTOR(redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_3(REG,53)
    redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_3_q <= STD_LOGIC_VECTOR(redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_0(REG,30)
    redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_r);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_1(REG,31)
    redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_1_q <= STD_LOGIC_VECTOR(redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_2(REG,32)
    redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_2_q <= STD_LOGIC_VECTOR(redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_3(REG,33)
    redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_3_q <= STD_LOGIC_VECTOR(redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0(REG,26)
    redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1(REG,27)
    redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_q <= STD_LOGIC_VECTOR(redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2(REG,28)
    redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_q <= STD_LOGIC_VECTOR(redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3(REG,29)
    redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_q <= STD_LOGIC_VECTOR(redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_0(REG,34)
    redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_kk);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_1(REG,35)
    redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_1_q <= STD_LOGIC_VECTOR(redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_2(REG,36)
    redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_2_q <= STD_LOGIC_VECTOR(redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_3(REG,37)
    redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_3_q <= STD_LOGIC_VECTOR(redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_0(REG,58)
    redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_qq);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_1(REG,59)
    redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_1_q <= STD_LOGIC_VECTOR(redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_2(REG,60)
    redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_2_q <= STD_LOGIC_VECTOR(redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_3(REG,61)
    redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_3_q <= STD_LOGIC_VECTOR(redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_0(REG,38)
    redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_0_backEN = "1") THEN
                redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B7_merge_reg_aunroll_x_ll);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_1(REG,39)
    redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_1_backEN = "1") THEN
                redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_1_q <= STD_LOGIC_VECTOR(redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_2(REG,40)
    redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_2_backEN = "1") THEN
                redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_2_q <= STD_LOGIC_VECTOR(redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_3(REG,41)
    redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_backEN = "1") THEN
                redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_3_q <= STD_LOGIC_VECTOR(redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x(BITJOIN,66)
    bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q <= i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_36 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_35 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_34 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_33 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_32 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_31 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_30 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_29 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_28 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_27 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_26 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_25 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_24 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_23 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_22 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_21 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_20 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_19 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_18 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_17 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_16 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_15 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_14 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_13 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_12 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_11 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_10 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_9 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_8 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_7 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_6 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_5 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_4 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_3 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_2 & i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_out_c0_exit152_1;

    -- bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x(BITSELECT,67)
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(5 downto 0));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(37 downto 6));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(69 downto 38));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(101 downto 70));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(133 downto 102));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(165 downto 134));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(197 downto 166));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(229 downto 198));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(261 downto 230));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(293 downto 262));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(325 downto 294));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(357 downto 326));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(389 downto 358));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(421 downto 390));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(453 downto 422));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(485 downto 454));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(517 downto 486));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(581 downto 518));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(645 downto 582));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(709 downto 646));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(773 downto 710));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(837 downto 774));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(901 downto 838));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(965 downto 902));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1029 downto 966));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1093 downto 1030));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1157 downto 1094));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1221 downto 1158));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1285 downto 1222));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ee <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1349 downto 1286));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ff <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1413 downto 1350));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_gg <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1477 downto 1414));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_hh <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1541 downto 1478));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ii <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1605 downto 1542));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_jj <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1637 downto 1606));
    bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_kk <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q(1638 downto 1638));

    -- dupName_0_sync_out_x(GPOUT,5)@5
    out_c0_exe10162 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_k;
    out_c0_exe1102 <= redist3_ethash_search_B7_merge_reg_aunroll_x_out_data_out_36_4_3_q;
    out_c0_exe11163 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_l;
    out_c0_exe1153 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_b;
    out_c0_exe12164 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_m;
    out_c0_exe13165 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_n;
    out_c0_exe14166 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_o;
    out_c0_exe15167 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_p;
    out_c0_exe16168 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_q;
    out_c0_exe17169 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_r;
    out_c0_exe18170 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_s;
    out_c0_exe19171 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_t;
    out_c0_exe20172 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_u;
    out_c0_exe21173 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_v;
    out_c0_exe2154 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_c;
    out_c0_exe22174 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_w;
    out_c0_exe23175 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_x;
    out_c0_exe24176 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_y;
    out_c0_exe25177 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_z;
    out_c0_exe26178 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_aa;
    out_c0_exe27179 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_bb;
    out_c0_exe28180 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_cc;
    out_c0_exe29181 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_dd;
    out_c0_exe30182 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ee;
    out_c0_exe31183 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ff;
    out_c0_exe3155 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_d;
    out_c0_exe32184 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_gg;
    out_c0_exe33185 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_hh;
    out_c0_exe34186 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_ii;
    out_c0_exe35187 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_jj;
    out_c0_exe36188 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_kk;
    out_c0_exe4156 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_e;
    out_c0_exe5157 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_f;
    out_c0_exe6158 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_g;
    out_c0_exe7159 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_h;
    out_c0_exe8160 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_i;
    out_c0_exe9161 <= bubble_select_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_j;
    out_global_id_0191 <= redist8_ethash_search_B7_merge_reg_aunroll_x_out_data_out_41_4_3_q;
    out_l_grpid_02 <= redist2_ethash_search_B7_merge_reg_aunroll_x_out_data_out_35_4_3_q;
    out_scalarizer_01232 <= redist0_ethash_search_B7_merge_reg_aunroll_x_out_data_out_15_4_3_q;
    out_scalarizer_11233 <= redist1_ethash_search_B7_merge_reg_aunroll_x_out_data_out_16_4_3_q;
    out_state_10_2_cast185 <= redist6_ethash_search_B7_merge_reg_aunroll_x_out_data_out_39_4_3_q;
    out_state_11_2_cast187 <= redist7_ethash_search_B7_merge_reg_aunroll_x_out_data_out_40_4_3_q;
    out_state_8_2_cast181 <= redist4_ethash_search_B7_merge_reg_aunroll_x_out_data_out_37_4_3_q;
    out_state_9_2_cast183 <= redist5_ethash_search_B7_merge_reg_aunroll_x_out_data_out_38_4_3_q;
    out_valid_out <= SE_out_i_sfc_c0_for_cond_i3_outer_ethash_search_c0_enter79_ethash_search_aunroll_x_V0;

    -- sync_out(GPOUT,16)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
