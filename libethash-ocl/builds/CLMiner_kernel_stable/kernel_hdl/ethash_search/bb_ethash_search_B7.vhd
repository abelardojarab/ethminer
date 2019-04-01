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

-- VHDL created from bb_ethash_search_B7
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

entity bb_ethash_search_B7 is
    port (
        in_arrayidx12_i_i19695_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx12_i_i19695_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx14_i_i21752_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx14_i_i21752_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx16_i_i23701_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx16_i_i23701_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx22_i_i28756_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx22_i_i28756_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx24_i_i30712_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx24_i_i30712_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx26_i_i32715_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx26_i_i32715_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx2_i_i10684_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx2_i_i10684_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30_i_i35720_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30_i_i35720_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx32_i_i37723_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx32_i_i37723_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx34_i_i39726_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx34_i_i39726_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_i_i41729_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_i_i41729_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx40_i_i44734_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx40_i_i44734_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx42_i_i46737_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx42_i_i46737_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx44_i_i48740_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx44_i_i48740_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx46_i_i50743_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx46_i_i50743_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx4_i_i12686_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx4_i_i12686_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx6_i_i14688_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx6_i_i14688_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe1102_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1102_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_0 : in std_logic_vector(5 downto 0);  -- ufix6
        in_fpgaindvars_iv_1 : in std_logic_vector(5 downto 0);  -- ufix6
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0191_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0191_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_02_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i1_ph_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i1_ph_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01218_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01218_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01220_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01220_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01222_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01222_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01224_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01224_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01226_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01226_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01228_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01228_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01230_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01230_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01232_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01232_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11219_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11219_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11221_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11221_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11223_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11223_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11225_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11225_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11227_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11227_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11229_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11229_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11231_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11231_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11233_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11233_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_10_2_cast185_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_10_2_cast185_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast187_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast187_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast181_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast181_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast183_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast183_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_10_2_cast185 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_11_2_cast187 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_8_2_cast181 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_9_2_cast183 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B7;

architecture normal of bb_ethash_search_B7 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_search_B7_stall_region is
        port (
            in_arrayidx12_i_i19695 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i21752 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i23701 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i28756 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i30712 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i32715 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i10684 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i35720 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i37723 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i39726 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i41729 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i44734 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i46737 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i48740 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i50743 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i12686 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i14688 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe1102 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_global_id_0191 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i1_ph : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01218 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01220 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01222 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01224 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01226 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01228 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01230 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11219 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11221 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11223 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11225 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11227 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11229 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11231 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_10_2_cast185 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast187 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast181 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast183 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10162 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1102 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11163 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1153 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exe12164 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13165 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14166 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15167 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16168 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17169 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18170 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe19171 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe20172 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe21173 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe2154 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe22174 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe23175 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe24176 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe25177 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe26178 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe27179 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe28180 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe29181 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe30182 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe31183 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3155 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe32184 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe33185 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe34186 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35187 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe36188 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe4156 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5157 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6158 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7159 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8160 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9161 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_0191 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01232 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11233 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_10_2_cast185 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_11_2_cast187 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_8_2_cast181 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_9_2_cast183 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B7_branch is
        port (
            in_c0_exe10162 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1102 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe11163 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1153 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_c0_exe12164 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe13165 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe14166 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe15167 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe16168 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe17169 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe18170 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe19171 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe20172 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe21173 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe2154 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe22174 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe23175 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe24176 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe25177 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe26178 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe27179 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe28180 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe29181 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe30182 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe31183 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3155 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe32184 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe33185 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe34186 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe35187 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe36188 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe4156 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe5157 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe6158 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe7159 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe8160 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe9161 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0191 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_10_2_cast185 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast187 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast181 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast183 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10162 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1102 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11163 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1153 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exe12164 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13165 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14166 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15167 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16168 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17169 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18170 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe19171 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe20172 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe21173 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe2154 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe22174 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe23175 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe24176 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe25177 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe26178 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe27179 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe28180 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe29181 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe30182 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe31183 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3155 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe32184 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe33185 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe34186 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35187 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4156 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5157 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6158 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7159 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8160 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9161 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_0191 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01232 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11233 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_10_2_cast185 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_11_2_cast187 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_8_2_cast181 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_9_2_cast183 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B7_merge is
        port (
            in_arrayidx12_i_i19695_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx12_i_i19695_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i21752_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i21752_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i23701_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i23701_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i28756_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i28756_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i30712_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i30712_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i32715_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i32715_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i10684_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i10684_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i35720_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i35720_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i37723_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i37723_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i39726_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i39726_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i41729_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i41729_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i44734_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i44734_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i46737_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i46737_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i48740_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i48740_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i50743_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i50743_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i12686_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i12686_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i14688_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i14688_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe1102_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1102_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_global_id_0191_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0191_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i1_ph_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i1_ph_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01218_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01218_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01220_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01220_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01222_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01222_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01224_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01224_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01226_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01226_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01228_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01228_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01230_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01230_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11219_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11219_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11221_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11221_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11223_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11223_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11225_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11225_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11227_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11227_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11229_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11229_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11231_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11231_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_10_2_cast185_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_10_2_cast185_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast187_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast187_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast181_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast181_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast183_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast183_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx12_i_i19695 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx14_i_i21752 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx16_i_i23701 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx22_i_i28756 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx24_i_i30712 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx26_i_i32715 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx2_i_i10684 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx30_i_i35720 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx32_i_i37723 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx34_i_i39726 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx36_i_i41729 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx40_i_i44734 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx42_i_i46737 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx44_i_i48740 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx46_i_i50743 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx4_i_i12686 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx6_i_i14688 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe1102 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_global_id_0191 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_r_0_i1_ph : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01218 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01220 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01222 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01224 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01226 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01228 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01230 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01232 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11219 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11223 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11225 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11227 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11229 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11231 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11233 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_10_2_cast185 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_11_2_cast187 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_8_2_cast181 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_9_2_cast183 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_ethash_search_B7_stall_region_out_c0_exe10162 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe1102 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe11163 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe1153 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe12164 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe13165 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe14166 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe15167 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe16168 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe17169 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe18170 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe19171 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe20172 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe21173 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe2154 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe22174 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe23175 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe24176 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe25177 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe26178 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe27179 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe28180 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe29181 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe30182 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe31183 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe3155 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe32184 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe33185 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe34186 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe35187 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe36188 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe4156 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe5157 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe6158 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe7159 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe8160 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_c0_exe9161 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_global_id_0191 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_l_grpid_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_scalarizer_01232 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_scalarizer_11233 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_stall_region_out_state_10_2_cast185 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_state_11_2_cast187 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_state_8_2_cast181 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_state_9_2_cast183 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_branch_out_c0_exe10162 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe1102 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_branch_out_c0_exe11163 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe1153 : STD_LOGIC_VECTOR (5 downto 0);
    signal ethash_search_B7_branch_out_c0_exe12164 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe13165 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe14166 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe15167 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe16168 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe17169 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe18170 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe19171 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe20172 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe21173 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe2154 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe22174 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe23175 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe24176 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe25177 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe26178 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe27179 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe28180 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe29181 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe30182 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe31183 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe3155 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe32184 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe33185 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe34186 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_c0_exe35187 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe4156 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe5157 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe6158 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe7159 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe8160 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_c0_exe9161 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_global_id_0191 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_l_grpid_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_scalarizer_01232 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_scalarizer_11233 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_branch_out_state_10_2_cast185 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_state_11_2_cast187 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_state_8_2_cast181 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_state_9_2_cast183 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_merge_out_arrayidx12_i_i19695 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx14_i_i21752 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx16_i_i23701 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx22_i_i28756 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx24_i_i30712 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx26_i_i32715 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx2_i_i10684 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx30_i_i35720 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx32_i_i37723 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx34_i_i39726 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx36_i_i41729 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx40_i_i44734 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx42_i_i46737 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx44_i_i48740 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx46_i_i50743 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx4_i_i12686 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_arrayidx6_i_i14688 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_c0_exe1102 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_merge_out_fpgaindvars_iv : STD_LOGIC_VECTOR (5 downto 0);
    signal ethash_search_B7_merge_out_global_id_0191 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_l_grpid_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_r_0_i1_ph : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_01218 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_01220 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_01222 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_01224 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_01226 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_01228 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_01230 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_01232 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_11219 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_11221 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_11223 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_11225 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_11227 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_11229 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_11231 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_scalarizer_11233 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B7_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B7_merge_out_state_10_2_cast185 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_state_11_2_cast187 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_state_8_2_cast181 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_state_9_2_cast183 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B7_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_search_B7_merge(BLACKBOX,4)
    theethash_search_B7_merge : ethash_search_B7_merge
    PORT MAP (
        in_arrayidx12_i_i19695_0 => in_arrayidx12_i_i19695_0,
        in_arrayidx12_i_i19695_1 => in_arrayidx12_i_i19695_1,
        in_arrayidx14_i_i21752_0 => in_arrayidx14_i_i21752_0,
        in_arrayidx14_i_i21752_1 => in_arrayidx14_i_i21752_1,
        in_arrayidx16_i_i23701_0 => in_arrayidx16_i_i23701_0,
        in_arrayidx16_i_i23701_1 => in_arrayidx16_i_i23701_1,
        in_arrayidx22_i_i28756_0 => in_arrayidx22_i_i28756_0,
        in_arrayidx22_i_i28756_1 => in_arrayidx22_i_i28756_1,
        in_arrayidx24_i_i30712_0 => in_arrayidx24_i_i30712_0,
        in_arrayidx24_i_i30712_1 => in_arrayidx24_i_i30712_1,
        in_arrayidx26_i_i32715_0 => in_arrayidx26_i_i32715_0,
        in_arrayidx26_i_i32715_1 => in_arrayidx26_i_i32715_1,
        in_arrayidx2_i_i10684_0 => in_arrayidx2_i_i10684_0,
        in_arrayidx2_i_i10684_1 => in_arrayidx2_i_i10684_1,
        in_arrayidx30_i_i35720_0 => in_arrayidx30_i_i35720_0,
        in_arrayidx30_i_i35720_1 => in_arrayidx30_i_i35720_1,
        in_arrayidx32_i_i37723_0 => in_arrayidx32_i_i37723_0,
        in_arrayidx32_i_i37723_1 => in_arrayidx32_i_i37723_1,
        in_arrayidx34_i_i39726_0 => in_arrayidx34_i_i39726_0,
        in_arrayidx34_i_i39726_1 => in_arrayidx34_i_i39726_1,
        in_arrayidx36_i_i41729_0 => in_arrayidx36_i_i41729_0,
        in_arrayidx36_i_i41729_1 => in_arrayidx36_i_i41729_1,
        in_arrayidx40_i_i44734_0 => in_arrayidx40_i_i44734_0,
        in_arrayidx40_i_i44734_1 => in_arrayidx40_i_i44734_1,
        in_arrayidx42_i_i46737_0 => in_arrayidx42_i_i46737_0,
        in_arrayidx42_i_i46737_1 => in_arrayidx42_i_i46737_1,
        in_arrayidx44_i_i48740_0 => in_arrayidx44_i_i48740_0,
        in_arrayidx44_i_i48740_1 => in_arrayidx44_i_i48740_1,
        in_arrayidx46_i_i50743_0 => in_arrayidx46_i_i50743_0,
        in_arrayidx46_i_i50743_1 => in_arrayidx46_i_i50743_1,
        in_arrayidx4_i_i12686_0 => in_arrayidx4_i_i12686_0,
        in_arrayidx4_i_i12686_1 => in_arrayidx4_i_i12686_1,
        in_arrayidx6_i_i14688_0 => in_arrayidx6_i_i14688_0,
        in_arrayidx6_i_i14688_1 => in_arrayidx6_i_i14688_1,
        in_c0_exe1102_0 => in_c0_exe1102_0,
        in_c0_exe1102_1 => in_c0_exe1102_1,
        in_fpgaindvars_iv_0 => in_fpgaindvars_iv_0,
        in_fpgaindvars_iv_1 => in_fpgaindvars_iv_1,
        in_global_id_0191_0 => in_global_id_0191_0,
        in_global_id_0191_1 => in_global_id_0191_1,
        in_l_grpid_02_0 => in_l_grpid_02_0,
        in_l_grpid_02_1 => in_l_grpid_02_1,
        in_r_0_i1_ph_0 => in_r_0_i1_ph_0,
        in_r_0_i1_ph_1 => in_r_0_i1_ph_1,
        in_scalarizer_01218_0 => in_scalarizer_01218_0,
        in_scalarizer_01218_1 => in_scalarizer_01218_1,
        in_scalarizer_01220_0 => in_scalarizer_01220_0,
        in_scalarizer_01220_1 => in_scalarizer_01220_1,
        in_scalarizer_01222_0 => in_scalarizer_01222_0,
        in_scalarizer_01222_1 => in_scalarizer_01222_1,
        in_scalarizer_01224_0 => in_scalarizer_01224_0,
        in_scalarizer_01224_1 => in_scalarizer_01224_1,
        in_scalarizer_01226_0 => in_scalarizer_01226_0,
        in_scalarizer_01226_1 => in_scalarizer_01226_1,
        in_scalarizer_01228_0 => in_scalarizer_01228_0,
        in_scalarizer_01228_1 => in_scalarizer_01228_1,
        in_scalarizer_01230_0 => in_scalarizer_01230_0,
        in_scalarizer_01230_1 => in_scalarizer_01230_1,
        in_scalarizer_01232_0 => in_scalarizer_01232_0,
        in_scalarizer_01232_1 => in_scalarizer_01232_1,
        in_scalarizer_11219_0 => in_scalarizer_11219_0,
        in_scalarizer_11219_1 => in_scalarizer_11219_1,
        in_scalarizer_11221_0 => in_scalarizer_11221_0,
        in_scalarizer_11221_1 => in_scalarizer_11221_1,
        in_scalarizer_11223_0 => in_scalarizer_11223_0,
        in_scalarizer_11223_1 => in_scalarizer_11223_1,
        in_scalarizer_11225_0 => in_scalarizer_11225_0,
        in_scalarizer_11225_1 => in_scalarizer_11225_1,
        in_scalarizer_11227_0 => in_scalarizer_11227_0,
        in_scalarizer_11227_1 => in_scalarizer_11227_1,
        in_scalarizer_11229_0 => in_scalarizer_11229_0,
        in_scalarizer_11229_1 => in_scalarizer_11229_1,
        in_scalarizer_11231_0 => in_scalarizer_11231_0,
        in_scalarizer_11231_1 => in_scalarizer_11231_1,
        in_scalarizer_11233_0 => in_scalarizer_11233_0,
        in_scalarizer_11233_1 => in_scalarizer_11233_1,
        in_stall_in => bb_ethash_search_B7_stall_region_out_stall_out,
        in_state_10_2_cast185_0 => in_state_10_2_cast185_0,
        in_state_10_2_cast185_1 => in_state_10_2_cast185_1,
        in_state_11_2_cast187_0 => in_state_11_2_cast187_0,
        in_state_11_2_cast187_1 => in_state_11_2_cast187_1,
        in_state_8_2_cast181_0 => in_state_8_2_cast181_0,
        in_state_8_2_cast181_1 => in_state_8_2_cast181_1,
        in_state_9_2_cast183_0 => in_state_9_2_cast183_0,
        in_state_9_2_cast183_1 => in_state_9_2_cast183_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_arrayidx12_i_i19695 => ethash_search_B7_merge_out_arrayidx12_i_i19695,
        out_arrayidx14_i_i21752 => ethash_search_B7_merge_out_arrayidx14_i_i21752,
        out_arrayidx16_i_i23701 => ethash_search_B7_merge_out_arrayidx16_i_i23701,
        out_arrayidx22_i_i28756 => ethash_search_B7_merge_out_arrayidx22_i_i28756,
        out_arrayidx24_i_i30712 => ethash_search_B7_merge_out_arrayidx24_i_i30712,
        out_arrayidx26_i_i32715 => ethash_search_B7_merge_out_arrayidx26_i_i32715,
        out_arrayidx2_i_i10684 => ethash_search_B7_merge_out_arrayidx2_i_i10684,
        out_arrayidx30_i_i35720 => ethash_search_B7_merge_out_arrayidx30_i_i35720,
        out_arrayidx32_i_i37723 => ethash_search_B7_merge_out_arrayidx32_i_i37723,
        out_arrayidx34_i_i39726 => ethash_search_B7_merge_out_arrayidx34_i_i39726,
        out_arrayidx36_i_i41729 => ethash_search_B7_merge_out_arrayidx36_i_i41729,
        out_arrayidx40_i_i44734 => ethash_search_B7_merge_out_arrayidx40_i_i44734,
        out_arrayidx42_i_i46737 => ethash_search_B7_merge_out_arrayidx42_i_i46737,
        out_arrayidx44_i_i48740 => ethash_search_B7_merge_out_arrayidx44_i_i48740,
        out_arrayidx46_i_i50743 => ethash_search_B7_merge_out_arrayidx46_i_i50743,
        out_arrayidx4_i_i12686 => ethash_search_B7_merge_out_arrayidx4_i_i12686,
        out_arrayidx6_i_i14688 => ethash_search_B7_merge_out_arrayidx6_i_i14688,
        out_c0_exe1102 => ethash_search_B7_merge_out_c0_exe1102,
        out_fpgaindvars_iv => ethash_search_B7_merge_out_fpgaindvars_iv,
        out_global_id_0191 => ethash_search_B7_merge_out_global_id_0191,
        out_l_grpid_02 => ethash_search_B7_merge_out_l_grpid_02,
        out_r_0_i1_ph => ethash_search_B7_merge_out_r_0_i1_ph,
        out_scalarizer_01218 => ethash_search_B7_merge_out_scalarizer_01218,
        out_scalarizer_01220 => ethash_search_B7_merge_out_scalarizer_01220,
        out_scalarizer_01222 => ethash_search_B7_merge_out_scalarizer_01222,
        out_scalarizer_01224 => ethash_search_B7_merge_out_scalarizer_01224,
        out_scalarizer_01226 => ethash_search_B7_merge_out_scalarizer_01226,
        out_scalarizer_01228 => ethash_search_B7_merge_out_scalarizer_01228,
        out_scalarizer_01230 => ethash_search_B7_merge_out_scalarizer_01230,
        out_scalarizer_01232 => ethash_search_B7_merge_out_scalarizer_01232,
        out_scalarizer_11219 => ethash_search_B7_merge_out_scalarizer_11219,
        out_scalarizer_11221 => ethash_search_B7_merge_out_scalarizer_11221,
        out_scalarizer_11223 => ethash_search_B7_merge_out_scalarizer_11223,
        out_scalarizer_11225 => ethash_search_B7_merge_out_scalarizer_11225,
        out_scalarizer_11227 => ethash_search_B7_merge_out_scalarizer_11227,
        out_scalarizer_11229 => ethash_search_B7_merge_out_scalarizer_11229,
        out_scalarizer_11231 => ethash_search_B7_merge_out_scalarizer_11231,
        out_scalarizer_11233 => ethash_search_B7_merge_out_scalarizer_11233,
        out_stall_out_0 => ethash_search_B7_merge_out_stall_out_0,
        out_stall_out_1 => ethash_search_B7_merge_out_stall_out_1,
        out_state_10_2_cast185 => ethash_search_B7_merge_out_state_10_2_cast185,
        out_state_11_2_cast187 => ethash_search_B7_merge_out_state_11_2_cast187,
        out_state_8_2_cast181 => ethash_search_B7_merge_out_state_8_2_cast181,
        out_state_9_2_cast183 => ethash_search_B7_merge_out_state_9_2_cast183,
        out_valid_out => ethash_search_B7_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B7_stall_region(BLACKBOX,2)
    thebb_ethash_search_B7_stall_region : bb_ethash_search_B7_stall_region
    PORT MAP (
        in_arrayidx12_i_i19695 => ethash_search_B7_merge_out_arrayidx12_i_i19695,
        in_arrayidx14_i_i21752 => ethash_search_B7_merge_out_arrayidx14_i_i21752,
        in_arrayidx16_i_i23701 => ethash_search_B7_merge_out_arrayidx16_i_i23701,
        in_arrayidx22_i_i28756 => ethash_search_B7_merge_out_arrayidx22_i_i28756,
        in_arrayidx24_i_i30712 => ethash_search_B7_merge_out_arrayidx24_i_i30712,
        in_arrayidx26_i_i32715 => ethash_search_B7_merge_out_arrayidx26_i_i32715,
        in_arrayidx2_i_i10684 => ethash_search_B7_merge_out_arrayidx2_i_i10684,
        in_arrayidx30_i_i35720 => ethash_search_B7_merge_out_arrayidx30_i_i35720,
        in_arrayidx32_i_i37723 => ethash_search_B7_merge_out_arrayidx32_i_i37723,
        in_arrayidx34_i_i39726 => ethash_search_B7_merge_out_arrayidx34_i_i39726,
        in_arrayidx36_i_i41729 => ethash_search_B7_merge_out_arrayidx36_i_i41729,
        in_arrayidx40_i_i44734 => ethash_search_B7_merge_out_arrayidx40_i_i44734,
        in_arrayidx42_i_i46737 => ethash_search_B7_merge_out_arrayidx42_i_i46737,
        in_arrayidx44_i_i48740 => ethash_search_B7_merge_out_arrayidx44_i_i48740,
        in_arrayidx46_i_i50743 => ethash_search_B7_merge_out_arrayidx46_i_i50743,
        in_arrayidx4_i_i12686 => ethash_search_B7_merge_out_arrayidx4_i_i12686,
        in_arrayidx6_i_i14688 => ethash_search_B7_merge_out_arrayidx6_i_i14688,
        in_c0_exe1102 => ethash_search_B7_merge_out_c0_exe1102,
        in_fpgaindvars_iv => ethash_search_B7_merge_out_fpgaindvars_iv,
        in_global_id_0191 => ethash_search_B7_merge_out_global_id_0191,
        in_l_grpid_02 => ethash_search_B7_merge_out_l_grpid_02,
        in_r_0_i1_ph => ethash_search_B7_merge_out_r_0_i1_ph,
        in_scalarizer_01218 => ethash_search_B7_merge_out_scalarizer_01218,
        in_scalarizer_01220 => ethash_search_B7_merge_out_scalarizer_01220,
        in_scalarizer_01222 => ethash_search_B7_merge_out_scalarizer_01222,
        in_scalarizer_01224 => ethash_search_B7_merge_out_scalarizer_01224,
        in_scalarizer_01226 => ethash_search_B7_merge_out_scalarizer_01226,
        in_scalarizer_01228 => ethash_search_B7_merge_out_scalarizer_01228,
        in_scalarizer_01230 => ethash_search_B7_merge_out_scalarizer_01230,
        in_scalarizer_01232 => ethash_search_B7_merge_out_scalarizer_01232,
        in_scalarizer_11219 => ethash_search_B7_merge_out_scalarizer_11219,
        in_scalarizer_11221 => ethash_search_B7_merge_out_scalarizer_11221,
        in_scalarizer_11223 => ethash_search_B7_merge_out_scalarizer_11223,
        in_scalarizer_11225 => ethash_search_B7_merge_out_scalarizer_11225,
        in_scalarizer_11227 => ethash_search_B7_merge_out_scalarizer_11227,
        in_scalarizer_11229 => ethash_search_B7_merge_out_scalarizer_11229,
        in_scalarizer_11231 => ethash_search_B7_merge_out_scalarizer_11231,
        in_scalarizer_11233 => ethash_search_B7_merge_out_scalarizer_11233,
        in_stall_in => ethash_search_B7_branch_out_stall_out,
        in_state_10_2_cast185 => ethash_search_B7_merge_out_state_10_2_cast185,
        in_state_11_2_cast187 => ethash_search_B7_merge_out_state_11_2_cast187,
        in_state_8_2_cast181 => ethash_search_B7_merge_out_state_8_2_cast181,
        in_state_9_2_cast183 => ethash_search_B7_merge_out_state_9_2_cast183,
        in_valid_in => ethash_search_B7_merge_out_valid_out,
        out_c0_exe10162 => bb_ethash_search_B7_stall_region_out_c0_exe10162,
        out_c0_exe1102 => bb_ethash_search_B7_stall_region_out_c0_exe1102,
        out_c0_exe11163 => bb_ethash_search_B7_stall_region_out_c0_exe11163,
        out_c0_exe1153 => bb_ethash_search_B7_stall_region_out_c0_exe1153,
        out_c0_exe12164 => bb_ethash_search_B7_stall_region_out_c0_exe12164,
        out_c0_exe13165 => bb_ethash_search_B7_stall_region_out_c0_exe13165,
        out_c0_exe14166 => bb_ethash_search_B7_stall_region_out_c0_exe14166,
        out_c0_exe15167 => bb_ethash_search_B7_stall_region_out_c0_exe15167,
        out_c0_exe16168 => bb_ethash_search_B7_stall_region_out_c0_exe16168,
        out_c0_exe17169 => bb_ethash_search_B7_stall_region_out_c0_exe17169,
        out_c0_exe18170 => bb_ethash_search_B7_stall_region_out_c0_exe18170,
        out_c0_exe19171 => bb_ethash_search_B7_stall_region_out_c0_exe19171,
        out_c0_exe20172 => bb_ethash_search_B7_stall_region_out_c0_exe20172,
        out_c0_exe21173 => bb_ethash_search_B7_stall_region_out_c0_exe21173,
        out_c0_exe2154 => bb_ethash_search_B7_stall_region_out_c0_exe2154,
        out_c0_exe22174 => bb_ethash_search_B7_stall_region_out_c0_exe22174,
        out_c0_exe23175 => bb_ethash_search_B7_stall_region_out_c0_exe23175,
        out_c0_exe24176 => bb_ethash_search_B7_stall_region_out_c0_exe24176,
        out_c0_exe25177 => bb_ethash_search_B7_stall_region_out_c0_exe25177,
        out_c0_exe26178 => bb_ethash_search_B7_stall_region_out_c0_exe26178,
        out_c0_exe27179 => bb_ethash_search_B7_stall_region_out_c0_exe27179,
        out_c0_exe28180 => bb_ethash_search_B7_stall_region_out_c0_exe28180,
        out_c0_exe29181 => bb_ethash_search_B7_stall_region_out_c0_exe29181,
        out_c0_exe30182 => bb_ethash_search_B7_stall_region_out_c0_exe30182,
        out_c0_exe31183 => bb_ethash_search_B7_stall_region_out_c0_exe31183,
        out_c0_exe3155 => bb_ethash_search_B7_stall_region_out_c0_exe3155,
        out_c0_exe32184 => bb_ethash_search_B7_stall_region_out_c0_exe32184,
        out_c0_exe33185 => bb_ethash_search_B7_stall_region_out_c0_exe33185,
        out_c0_exe34186 => bb_ethash_search_B7_stall_region_out_c0_exe34186,
        out_c0_exe35187 => bb_ethash_search_B7_stall_region_out_c0_exe35187,
        out_c0_exe36188 => bb_ethash_search_B7_stall_region_out_c0_exe36188,
        out_c0_exe4156 => bb_ethash_search_B7_stall_region_out_c0_exe4156,
        out_c0_exe5157 => bb_ethash_search_B7_stall_region_out_c0_exe5157,
        out_c0_exe6158 => bb_ethash_search_B7_stall_region_out_c0_exe6158,
        out_c0_exe7159 => bb_ethash_search_B7_stall_region_out_c0_exe7159,
        out_c0_exe8160 => bb_ethash_search_B7_stall_region_out_c0_exe8160,
        out_c0_exe9161 => bb_ethash_search_B7_stall_region_out_c0_exe9161,
        out_global_id_0191 => bb_ethash_search_B7_stall_region_out_global_id_0191,
        out_l_grpid_02 => bb_ethash_search_B7_stall_region_out_l_grpid_02,
        out_scalarizer_01232 => bb_ethash_search_B7_stall_region_out_scalarizer_01232,
        out_scalarizer_11233 => bb_ethash_search_B7_stall_region_out_scalarizer_11233,
        out_stall_out => bb_ethash_search_B7_stall_region_out_stall_out,
        out_state_10_2_cast185 => bb_ethash_search_B7_stall_region_out_state_10_2_cast185,
        out_state_11_2_cast187 => bb_ethash_search_B7_stall_region_out_state_11_2_cast187,
        out_state_8_2_cast181 => bb_ethash_search_B7_stall_region_out_state_8_2_cast181,
        out_state_9_2_cast183 => bb_ethash_search_B7_stall_region_out_state_9_2_cast183,
        out_valid_out => bb_ethash_search_B7_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B7_branch(BLACKBOX,3)
    theethash_search_B7_branch : ethash_search_B7_branch
    PORT MAP (
        in_c0_exe10162 => bb_ethash_search_B7_stall_region_out_c0_exe10162,
        in_c0_exe1102 => bb_ethash_search_B7_stall_region_out_c0_exe1102,
        in_c0_exe11163 => bb_ethash_search_B7_stall_region_out_c0_exe11163,
        in_c0_exe1153 => bb_ethash_search_B7_stall_region_out_c0_exe1153,
        in_c0_exe12164 => bb_ethash_search_B7_stall_region_out_c0_exe12164,
        in_c0_exe13165 => bb_ethash_search_B7_stall_region_out_c0_exe13165,
        in_c0_exe14166 => bb_ethash_search_B7_stall_region_out_c0_exe14166,
        in_c0_exe15167 => bb_ethash_search_B7_stall_region_out_c0_exe15167,
        in_c0_exe16168 => bb_ethash_search_B7_stall_region_out_c0_exe16168,
        in_c0_exe17169 => bb_ethash_search_B7_stall_region_out_c0_exe17169,
        in_c0_exe18170 => bb_ethash_search_B7_stall_region_out_c0_exe18170,
        in_c0_exe19171 => bb_ethash_search_B7_stall_region_out_c0_exe19171,
        in_c0_exe20172 => bb_ethash_search_B7_stall_region_out_c0_exe20172,
        in_c0_exe21173 => bb_ethash_search_B7_stall_region_out_c0_exe21173,
        in_c0_exe2154 => bb_ethash_search_B7_stall_region_out_c0_exe2154,
        in_c0_exe22174 => bb_ethash_search_B7_stall_region_out_c0_exe22174,
        in_c0_exe23175 => bb_ethash_search_B7_stall_region_out_c0_exe23175,
        in_c0_exe24176 => bb_ethash_search_B7_stall_region_out_c0_exe24176,
        in_c0_exe25177 => bb_ethash_search_B7_stall_region_out_c0_exe25177,
        in_c0_exe26178 => bb_ethash_search_B7_stall_region_out_c0_exe26178,
        in_c0_exe27179 => bb_ethash_search_B7_stall_region_out_c0_exe27179,
        in_c0_exe28180 => bb_ethash_search_B7_stall_region_out_c0_exe28180,
        in_c0_exe29181 => bb_ethash_search_B7_stall_region_out_c0_exe29181,
        in_c0_exe30182 => bb_ethash_search_B7_stall_region_out_c0_exe30182,
        in_c0_exe31183 => bb_ethash_search_B7_stall_region_out_c0_exe31183,
        in_c0_exe3155 => bb_ethash_search_B7_stall_region_out_c0_exe3155,
        in_c0_exe32184 => bb_ethash_search_B7_stall_region_out_c0_exe32184,
        in_c0_exe33185 => bb_ethash_search_B7_stall_region_out_c0_exe33185,
        in_c0_exe34186 => bb_ethash_search_B7_stall_region_out_c0_exe34186,
        in_c0_exe35187 => bb_ethash_search_B7_stall_region_out_c0_exe35187,
        in_c0_exe36188 => bb_ethash_search_B7_stall_region_out_c0_exe36188,
        in_c0_exe4156 => bb_ethash_search_B7_stall_region_out_c0_exe4156,
        in_c0_exe5157 => bb_ethash_search_B7_stall_region_out_c0_exe5157,
        in_c0_exe6158 => bb_ethash_search_B7_stall_region_out_c0_exe6158,
        in_c0_exe7159 => bb_ethash_search_B7_stall_region_out_c0_exe7159,
        in_c0_exe8160 => bb_ethash_search_B7_stall_region_out_c0_exe8160,
        in_c0_exe9161 => bb_ethash_search_B7_stall_region_out_c0_exe9161,
        in_global_id_0191 => bb_ethash_search_B7_stall_region_out_global_id_0191,
        in_l_grpid_02 => bb_ethash_search_B7_stall_region_out_l_grpid_02,
        in_scalarizer_01232 => bb_ethash_search_B7_stall_region_out_scalarizer_01232,
        in_scalarizer_11233 => bb_ethash_search_B7_stall_region_out_scalarizer_11233,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_state_10_2_cast185 => bb_ethash_search_B7_stall_region_out_state_10_2_cast185,
        in_state_11_2_cast187 => bb_ethash_search_B7_stall_region_out_state_11_2_cast187,
        in_state_8_2_cast181 => bb_ethash_search_B7_stall_region_out_state_8_2_cast181,
        in_state_9_2_cast183 => bb_ethash_search_B7_stall_region_out_state_9_2_cast183,
        in_valid_in => bb_ethash_search_B7_stall_region_out_valid_out,
        out_c0_exe10162 => ethash_search_B7_branch_out_c0_exe10162,
        out_c0_exe1102 => ethash_search_B7_branch_out_c0_exe1102,
        out_c0_exe11163 => ethash_search_B7_branch_out_c0_exe11163,
        out_c0_exe1153 => ethash_search_B7_branch_out_c0_exe1153,
        out_c0_exe12164 => ethash_search_B7_branch_out_c0_exe12164,
        out_c0_exe13165 => ethash_search_B7_branch_out_c0_exe13165,
        out_c0_exe14166 => ethash_search_B7_branch_out_c0_exe14166,
        out_c0_exe15167 => ethash_search_B7_branch_out_c0_exe15167,
        out_c0_exe16168 => ethash_search_B7_branch_out_c0_exe16168,
        out_c0_exe17169 => ethash_search_B7_branch_out_c0_exe17169,
        out_c0_exe18170 => ethash_search_B7_branch_out_c0_exe18170,
        out_c0_exe19171 => ethash_search_B7_branch_out_c0_exe19171,
        out_c0_exe20172 => ethash_search_B7_branch_out_c0_exe20172,
        out_c0_exe21173 => ethash_search_B7_branch_out_c0_exe21173,
        out_c0_exe2154 => ethash_search_B7_branch_out_c0_exe2154,
        out_c0_exe22174 => ethash_search_B7_branch_out_c0_exe22174,
        out_c0_exe23175 => ethash_search_B7_branch_out_c0_exe23175,
        out_c0_exe24176 => ethash_search_B7_branch_out_c0_exe24176,
        out_c0_exe25177 => ethash_search_B7_branch_out_c0_exe25177,
        out_c0_exe26178 => ethash_search_B7_branch_out_c0_exe26178,
        out_c0_exe27179 => ethash_search_B7_branch_out_c0_exe27179,
        out_c0_exe28180 => ethash_search_B7_branch_out_c0_exe28180,
        out_c0_exe29181 => ethash_search_B7_branch_out_c0_exe29181,
        out_c0_exe30182 => ethash_search_B7_branch_out_c0_exe30182,
        out_c0_exe31183 => ethash_search_B7_branch_out_c0_exe31183,
        out_c0_exe3155 => ethash_search_B7_branch_out_c0_exe3155,
        out_c0_exe32184 => ethash_search_B7_branch_out_c0_exe32184,
        out_c0_exe33185 => ethash_search_B7_branch_out_c0_exe33185,
        out_c0_exe34186 => ethash_search_B7_branch_out_c0_exe34186,
        out_c0_exe35187 => ethash_search_B7_branch_out_c0_exe35187,
        out_c0_exe4156 => ethash_search_B7_branch_out_c0_exe4156,
        out_c0_exe5157 => ethash_search_B7_branch_out_c0_exe5157,
        out_c0_exe6158 => ethash_search_B7_branch_out_c0_exe6158,
        out_c0_exe7159 => ethash_search_B7_branch_out_c0_exe7159,
        out_c0_exe8160 => ethash_search_B7_branch_out_c0_exe8160,
        out_c0_exe9161 => ethash_search_B7_branch_out_c0_exe9161,
        out_global_id_0191 => ethash_search_B7_branch_out_global_id_0191,
        out_l_grpid_02 => ethash_search_B7_branch_out_l_grpid_02,
        out_scalarizer_01232 => ethash_search_B7_branch_out_scalarizer_01232,
        out_scalarizer_11233 => ethash_search_B7_branch_out_scalarizer_11233,
        out_stall_out => ethash_search_B7_branch_out_stall_out,
        out_state_10_2_cast185 => ethash_search_B7_branch_out_state_10_2_cast185,
        out_state_11_2_cast187 => ethash_search_B7_branch_out_state_11_2_cast187,
        out_state_8_2_cast181 => ethash_search_B7_branch_out_state_8_2_cast181,
        out_state_9_2_cast183 => ethash_search_B7_branch_out_state_9_2_cast183,
        out_valid_out_0 => ethash_search_B7_branch_out_valid_out_0,
        out_valid_out_1 => ethash_search_B7_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe10162(GPOUT,95)
    out_c0_exe10162 <= ethash_search_B7_branch_out_c0_exe10162;

    -- out_c0_exe1102(GPOUT,96)
    out_c0_exe1102 <= ethash_search_B7_branch_out_c0_exe1102;

    -- out_c0_exe11163(GPOUT,97)
    out_c0_exe11163 <= ethash_search_B7_branch_out_c0_exe11163;

    -- out_c0_exe1153(GPOUT,98)
    out_c0_exe1153 <= ethash_search_B7_branch_out_c0_exe1153;

    -- out_c0_exe12164(GPOUT,99)
    out_c0_exe12164 <= ethash_search_B7_branch_out_c0_exe12164;

    -- out_c0_exe13165(GPOUT,100)
    out_c0_exe13165 <= ethash_search_B7_branch_out_c0_exe13165;

    -- out_c0_exe14166(GPOUT,101)
    out_c0_exe14166 <= ethash_search_B7_branch_out_c0_exe14166;

    -- out_c0_exe15167(GPOUT,102)
    out_c0_exe15167 <= ethash_search_B7_branch_out_c0_exe15167;

    -- out_c0_exe16168(GPOUT,103)
    out_c0_exe16168 <= ethash_search_B7_branch_out_c0_exe16168;

    -- out_c0_exe17169(GPOUT,104)
    out_c0_exe17169 <= ethash_search_B7_branch_out_c0_exe17169;

    -- out_c0_exe18170(GPOUT,105)
    out_c0_exe18170 <= ethash_search_B7_branch_out_c0_exe18170;

    -- out_c0_exe19171(GPOUT,106)
    out_c0_exe19171 <= ethash_search_B7_branch_out_c0_exe19171;

    -- out_c0_exe20172(GPOUT,107)
    out_c0_exe20172 <= ethash_search_B7_branch_out_c0_exe20172;

    -- out_c0_exe21173(GPOUT,108)
    out_c0_exe21173 <= ethash_search_B7_branch_out_c0_exe21173;

    -- out_c0_exe2154(GPOUT,109)
    out_c0_exe2154 <= ethash_search_B7_branch_out_c0_exe2154;

    -- out_c0_exe22174(GPOUT,110)
    out_c0_exe22174 <= ethash_search_B7_branch_out_c0_exe22174;

    -- out_c0_exe23175(GPOUT,111)
    out_c0_exe23175 <= ethash_search_B7_branch_out_c0_exe23175;

    -- out_c0_exe24176(GPOUT,112)
    out_c0_exe24176 <= ethash_search_B7_branch_out_c0_exe24176;

    -- out_c0_exe25177(GPOUT,113)
    out_c0_exe25177 <= ethash_search_B7_branch_out_c0_exe25177;

    -- out_c0_exe26178(GPOUT,114)
    out_c0_exe26178 <= ethash_search_B7_branch_out_c0_exe26178;

    -- out_c0_exe27179(GPOUT,115)
    out_c0_exe27179 <= ethash_search_B7_branch_out_c0_exe27179;

    -- out_c0_exe28180(GPOUT,116)
    out_c0_exe28180 <= ethash_search_B7_branch_out_c0_exe28180;

    -- out_c0_exe29181(GPOUT,117)
    out_c0_exe29181 <= ethash_search_B7_branch_out_c0_exe29181;

    -- out_c0_exe30182(GPOUT,118)
    out_c0_exe30182 <= ethash_search_B7_branch_out_c0_exe30182;

    -- out_c0_exe31183(GPOUT,119)
    out_c0_exe31183 <= ethash_search_B7_branch_out_c0_exe31183;

    -- out_c0_exe3155(GPOUT,120)
    out_c0_exe3155 <= ethash_search_B7_branch_out_c0_exe3155;

    -- out_c0_exe32184(GPOUT,121)
    out_c0_exe32184 <= ethash_search_B7_branch_out_c0_exe32184;

    -- out_c0_exe33185(GPOUT,122)
    out_c0_exe33185 <= ethash_search_B7_branch_out_c0_exe33185;

    -- out_c0_exe34186(GPOUT,123)
    out_c0_exe34186 <= ethash_search_B7_branch_out_c0_exe34186;

    -- out_c0_exe35187(GPOUT,124)
    out_c0_exe35187 <= ethash_search_B7_branch_out_c0_exe35187;

    -- out_c0_exe4156(GPOUT,125)
    out_c0_exe4156 <= ethash_search_B7_branch_out_c0_exe4156;

    -- out_c0_exe5157(GPOUT,126)
    out_c0_exe5157 <= ethash_search_B7_branch_out_c0_exe5157;

    -- out_c0_exe6158(GPOUT,127)
    out_c0_exe6158 <= ethash_search_B7_branch_out_c0_exe6158;

    -- out_c0_exe7159(GPOUT,128)
    out_c0_exe7159 <= ethash_search_B7_branch_out_c0_exe7159;

    -- out_c0_exe8160(GPOUT,129)
    out_c0_exe8160 <= ethash_search_B7_branch_out_c0_exe8160;

    -- out_c0_exe9161(GPOUT,130)
    out_c0_exe9161 <= ethash_search_B7_branch_out_c0_exe9161;

    -- out_global_id_0191(GPOUT,131)
    out_global_id_0191 <= ethash_search_B7_branch_out_global_id_0191;

    -- out_l_grpid_02(GPOUT,132)
    out_l_grpid_02 <= ethash_search_B7_branch_out_l_grpid_02;

    -- out_scalarizer_01232(GPOUT,133)
    out_scalarizer_01232 <= ethash_search_B7_branch_out_scalarizer_01232;

    -- out_scalarizer_11233(GPOUT,134)
    out_scalarizer_11233 <= ethash_search_B7_branch_out_scalarizer_11233;

    -- out_stall_out_0(GPOUT,135)
    out_stall_out_0 <= ethash_search_B7_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,136)
    out_stall_out_1 <= ethash_search_B7_merge_out_stall_out_1;

    -- out_state_10_2_cast185(GPOUT,137)
    out_state_10_2_cast185 <= ethash_search_B7_branch_out_state_10_2_cast185;

    -- out_state_11_2_cast187(GPOUT,138)
    out_state_11_2_cast187 <= ethash_search_B7_branch_out_state_11_2_cast187;

    -- out_state_8_2_cast181(GPOUT,139)
    out_state_8_2_cast181 <= ethash_search_B7_branch_out_state_8_2_cast181;

    -- out_state_9_2_cast183(GPOUT,140)
    out_state_9_2_cast183 <= ethash_search_B7_branch_out_state_9_2_cast183;

    -- out_valid_out_0(GPOUT,141)
    out_valid_out_0 <= ethash_search_B7_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,142)
    out_valid_out_1 <= ethash_search_B7_branch_out_valid_out_1;

END normal;
