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

-- VHDL created from ethash_search_B7_merge
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

entity ethash_search_B7_merge is
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_10_2_cast185_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_10_2_cast185_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast187_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast187_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast181_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast181_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast183_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast183_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_arrayidx12_i_i19695 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx14_i_i21752 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx16_i_i23701 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx22_i_i28756 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx24_i_i30712 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx26_i_i32715 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx2_i_i10684 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx30_i_i35720 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx32_i_i37723 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx34_i_i39726 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx36_i_i41729 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx40_i_i44734 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx42_i_i46737 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx44_i_i48740 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx46_i_i50743 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx4_i_i12686 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx6_i_i14688 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1102 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv : out std_logic_vector(5 downto 0);  -- ufix6
        out_global_id_0191 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- ufix32
        out_r_0_i1_ph : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01218 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01220 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01222 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01224 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01226 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01228 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01230 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01232 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11219 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11221 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11223 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11225 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11227 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11229 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11231 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11233 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_10_2_cast185 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_11_2_cast187 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_8_2_cast181 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_9_2_cast183 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B7_merge;

architecture normal of ethash_search_B7_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx12_i_i19695_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx12_i_i19695_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx14_i_i21752_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx14_i_i21752_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx16_i_i23701_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx16_i_i23701_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx22_i_i28756_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx22_i_i28756_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx24_i_i30712_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx24_i_i30712_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx26_i_i32715_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx26_i_i32715_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx2_i_i10684_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx2_i_i10684_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx30_i_i35720_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx30_i_i35720_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx32_i_i37723_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx32_i_i37723_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx34_i_i39726_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx34_i_i39726_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx36_i_i41729_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx36_i_i41729_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx40_i_i44734_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx40_i_i44734_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx42_i_i46737_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx42_i_i46737_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx44_i_i48740_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx44_i_i48740_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx46_i_i50743_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx46_i_i50743_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx4_i_i12686_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx4_i_i12686_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx6_i_i14688_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx6_i_i14688_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe1102_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1102_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_q : STD_LOGIC_VECTOR (5 downto 0);
    signal global_id_0191_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_0191_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_02_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_02_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal r_0_i1_ph_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_0_i1_ph_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01218_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01218_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01220_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01220_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01222_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01222_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01224_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01224_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01226_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01226_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01228_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01228_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01230_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01230_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01232_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01232_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11219_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11219_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11221_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11221_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11223_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11223_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11225_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11225_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11227_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11227_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11229_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11229_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11231_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11231_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11233_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11233_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal state_10_2_cast185_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_10_2_cast185_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_11_2_cast187_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_11_2_cast187_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_8_2_cast181_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_8_2_cast181_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_9_2_cast183_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_9_2_cast183_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- arrayidx12_i_i19695_mux(MUX,2)
    arrayidx12_i_i19695_mux_s <= in_valid_in_0;
    arrayidx12_i_i19695_mux_combproc: PROCESS (arrayidx12_i_i19695_mux_s, in_arrayidx12_i_i19695_1, in_arrayidx12_i_i19695_0)
    BEGIN
        CASE (arrayidx12_i_i19695_mux_s) IS
            WHEN "0" => arrayidx12_i_i19695_mux_q <= in_arrayidx12_i_i19695_1;
            WHEN "1" => arrayidx12_i_i19695_mux_q <= in_arrayidx12_i_i19695_0;
            WHEN OTHERS => arrayidx12_i_i19695_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx12_i_i19695(GPOUT,110)
    out_arrayidx12_i_i19695 <= arrayidx12_i_i19695_mux_q;

    -- arrayidx14_i_i21752_mux(MUX,3)
    arrayidx14_i_i21752_mux_s <= in_valid_in_0;
    arrayidx14_i_i21752_mux_combproc: PROCESS (arrayidx14_i_i21752_mux_s, in_arrayidx14_i_i21752_1, in_arrayidx14_i_i21752_0)
    BEGIN
        CASE (arrayidx14_i_i21752_mux_s) IS
            WHEN "0" => arrayidx14_i_i21752_mux_q <= in_arrayidx14_i_i21752_1;
            WHEN "1" => arrayidx14_i_i21752_mux_q <= in_arrayidx14_i_i21752_0;
            WHEN OTHERS => arrayidx14_i_i21752_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx14_i_i21752(GPOUT,111)
    out_arrayidx14_i_i21752 <= arrayidx14_i_i21752_mux_q;

    -- arrayidx16_i_i23701_mux(MUX,4)
    arrayidx16_i_i23701_mux_s <= in_valid_in_0;
    arrayidx16_i_i23701_mux_combproc: PROCESS (arrayidx16_i_i23701_mux_s, in_arrayidx16_i_i23701_1, in_arrayidx16_i_i23701_0)
    BEGIN
        CASE (arrayidx16_i_i23701_mux_s) IS
            WHEN "0" => arrayidx16_i_i23701_mux_q <= in_arrayidx16_i_i23701_1;
            WHEN "1" => arrayidx16_i_i23701_mux_q <= in_arrayidx16_i_i23701_0;
            WHEN OTHERS => arrayidx16_i_i23701_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx16_i_i23701(GPOUT,112)
    out_arrayidx16_i_i23701 <= arrayidx16_i_i23701_mux_q;

    -- arrayidx22_i_i28756_mux(MUX,5)
    arrayidx22_i_i28756_mux_s <= in_valid_in_0;
    arrayidx22_i_i28756_mux_combproc: PROCESS (arrayidx22_i_i28756_mux_s, in_arrayidx22_i_i28756_1, in_arrayidx22_i_i28756_0)
    BEGIN
        CASE (arrayidx22_i_i28756_mux_s) IS
            WHEN "0" => arrayidx22_i_i28756_mux_q <= in_arrayidx22_i_i28756_1;
            WHEN "1" => arrayidx22_i_i28756_mux_q <= in_arrayidx22_i_i28756_0;
            WHEN OTHERS => arrayidx22_i_i28756_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx22_i_i28756(GPOUT,113)
    out_arrayidx22_i_i28756 <= arrayidx22_i_i28756_mux_q;

    -- arrayidx24_i_i30712_mux(MUX,6)
    arrayidx24_i_i30712_mux_s <= in_valid_in_0;
    arrayidx24_i_i30712_mux_combproc: PROCESS (arrayidx24_i_i30712_mux_s, in_arrayidx24_i_i30712_1, in_arrayidx24_i_i30712_0)
    BEGIN
        CASE (arrayidx24_i_i30712_mux_s) IS
            WHEN "0" => arrayidx24_i_i30712_mux_q <= in_arrayidx24_i_i30712_1;
            WHEN "1" => arrayidx24_i_i30712_mux_q <= in_arrayidx24_i_i30712_0;
            WHEN OTHERS => arrayidx24_i_i30712_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx24_i_i30712(GPOUT,114)
    out_arrayidx24_i_i30712 <= arrayidx24_i_i30712_mux_q;

    -- arrayidx26_i_i32715_mux(MUX,7)
    arrayidx26_i_i32715_mux_s <= in_valid_in_0;
    arrayidx26_i_i32715_mux_combproc: PROCESS (arrayidx26_i_i32715_mux_s, in_arrayidx26_i_i32715_1, in_arrayidx26_i_i32715_0)
    BEGIN
        CASE (arrayidx26_i_i32715_mux_s) IS
            WHEN "0" => arrayidx26_i_i32715_mux_q <= in_arrayidx26_i_i32715_1;
            WHEN "1" => arrayidx26_i_i32715_mux_q <= in_arrayidx26_i_i32715_0;
            WHEN OTHERS => arrayidx26_i_i32715_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx26_i_i32715(GPOUT,115)
    out_arrayidx26_i_i32715 <= arrayidx26_i_i32715_mux_q;

    -- arrayidx2_i_i10684_mux(MUX,8)
    arrayidx2_i_i10684_mux_s <= in_valid_in_0;
    arrayidx2_i_i10684_mux_combproc: PROCESS (arrayidx2_i_i10684_mux_s, in_arrayidx2_i_i10684_1, in_arrayidx2_i_i10684_0)
    BEGIN
        CASE (arrayidx2_i_i10684_mux_s) IS
            WHEN "0" => arrayidx2_i_i10684_mux_q <= in_arrayidx2_i_i10684_1;
            WHEN "1" => arrayidx2_i_i10684_mux_q <= in_arrayidx2_i_i10684_0;
            WHEN OTHERS => arrayidx2_i_i10684_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx2_i_i10684(GPOUT,116)
    out_arrayidx2_i_i10684 <= arrayidx2_i_i10684_mux_q;

    -- arrayidx30_i_i35720_mux(MUX,9)
    arrayidx30_i_i35720_mux_s <= in_valid_in_0;
    arrayidx30_i_i35720_mux_combproc: PROCESS (arrayidx30_i_i35720_mux_s, in_arrayidx30_i_i35720_1, in_arrayidx30_i_i35720_0)
    BEGIN
        CASE (arrayidx30_i_i35720_mux_s) IS
            WHEN "0" => arrayidx30_i_i35720_mux_q <= in_arrayidx30_i_i35720_1;
            WHEN "1" => arrayidx30_i_i35720_mux_q <= in_arrayidx30_i_i35720_0;
            WHEN OTHERS => arrayidx30_i_i35720_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx30_i_i35720(GPOUT,117)
    out_arrayidx30_i_i35720 <= arrayidx30_i_i35720_mux_q;

    -- arrayidx32_i_i37723_mux(MUX,10)
    arrayidx32_i_i37723_mux_s <= in_valid_in_0;
    arrayidx32_i_i37723_mux_combproc: PROCESS (arrayidx32_i_i37723_mux_s, in_arrayidx32_i_i37723_1, in_arrayidx32_i_i37723_0)
    BEGIN
        CASE (arrayidx32_i_i37723_mux_s) IS
            WHEN "0" => arrayidx32_i_i37723_mux_q <= in_arrayidx32_i_i37723_1;
            WHEN "1" => arrayidx32_i_i37723_mux_q <= in_arrayidx32_i_i37723_0;
            WHEN OTHERS => arrayidx32_i_i37723_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx32_i_i37723(GPOUT,118)
    out_arrayidx32_i_i37723 <= arrayidx32_i_i37723_mux_q;

    -- arrayidx34_i_i39726_mux(MUX,11)
    arrayidx34_i_i39726_mux_s <= in_valid_in_0;
    arrayidx34_i_i39726_mux_combproc: PROCESS (arrayidx34_i_i39726_mux_s, in_arrayidx34_i_i39726_1, in_arrayidx34_i_i39726_0)
    BEGIN
        CASE (arrayidx34_i_i39726_mux_s) IS
            WHEN "0" => arrayidx34_i_i39726_mux_q <= in_arrayidx34_i_i39726_1;
            WHEN "1" => arrayidx34_i_i39726_mux_q <= in_arrayidx34_i_i39726_0;
            WHEN OTHERS => arrayidx34_i_i39726_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx34_i_i39726(GPOUT,119)
    out_arrayidx34_i_i39726 <= arrayidx34_i_i39726_mux_q;

    -- arrayidx36_i_i41729_mux(MUX,12)
    arrayidx36_i_i41729_mux_s <= in_valid_in_0;
    arrayidx36_i_i41729_mux_combproc: PROCESS (arrayidx36_i_i41729_mux_s, in_arrayidx36_i_i41729_1, in_arrayidx36_i_i41729_0)
    BEGIN
        CASE (arrayidx36_i_i41729_mux_s) IS
            WHEN "0" => arrayidx36_i_i41729_mux_q <= in_arrayidx36_i_i41729_1;
            WHEN "1" => arrayidx36_i_i41729_mux_q <= in_arrayidx36_i_i41729_0;
            WHEN OTHERS => arrayidx36_i_i41729_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx36_i_i41729(GPOUT,120)
    out_arrayidx36_i_i41729 <= arrayidx36_i_i41729_mux_q;

    -- arrayidx40_i_i44734_mux(MUX,13)
    arrayidx40_i_i44734_mux_s <= in_valid_in_0;
    arrayidx40_i_i44734_mux_combproc: PROCESS (arrayidx40_i_i44734_mux_s, in_arrayidx40_i_i44734_1, in_arrayidx40_i_i44734_0)
    BEGIN
        CASE (arrayidx40_i_i44734_mux_s) IS
            WHEN "0" => arrayidx40_i_i44734_mux_q <= in_arrayidx40_i_i44734_1;
            WHEN "1" => arrayidx40_i_i44734_mux_q <= in_arrayidx40_i_i44734_0;
            WHEN OTHERS => arrayidx40_i_i44734_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx40_i_i44734(GPOUT,121)
    out_arrayidx40_i_i44734 <= arrayidx40_i_i44734_mux_q;

    -- arrayidx42_i_i46737_mux(MUX,14)
    arrayidx42_i_i46737_mux_s <= in_valid_in_0;
    arrayidx42_i_i46737_mux_combproc: PROCESS (arrayidx42_i_i46737_mux_s, in_arrayidx42_i_i46737_1, in_arrayidx42_i_i46737_0)
    BEGIN
        CASE (arrayidx42_i_i46737_mux_s) IS
            WHEN "0" => arrayidx42_i_i46737_mux_q <= in_arrayidx42_i_i46737_1;
            WHEN "1" => arrayidx42_i_i46737_mux_q <= in_arrayidx42_i_i46737_0;
            WHEN OTHERS => arrayidx42_i_i46737_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx42_i_i46737(GPOUT,122)
    out_arrayidx42_i_i46737 <= arrayidx42_i_i46737_mux_q;

    -- arrayidx44_i_i48740_mux(MUX,15)
    arrayidx44_i_i48740_mux_s <= in_valid_in_0;
    arrayidx44_i_i48740_mux_combproc: PROCESS (arrayidx44_i_i48740_mux_s, in_arrayidx44_i_i48740_1, in_arrayidx44_i_i48740_0)
    BEGIN
        CASE (arrayidx44_i_i48740_mux_s) IS
            WHEN "0" => arrayidx44_i_i48740_mux_q <= in_arrayidx44_i_i48740_1;
            WHEN "1" => arrayidx44_i_i48740_mux_q <= in_arrayidx44_i_i48740_0;
            WHEN OTHERS => arrayidx44_i_i48740_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx44_i_i48740(GPOUT,123)
    out_arrayidx44_i_i48740 <= arrayidx44_i_i48740_mux_q;

    -- arrayidx46_i_i50743_mux(MUX,16)
    arrayidx46_i_i50743_mux_s <= in_valid_in_0;
    arrayidx46_i_i50743_mux_combproc: PROCESS (arrayidx46_i_i50743_mux_s, in_arrayidx46_i_i50743_1, in_arrayidx46_i_i50743_0)
    BEGIN
        CASE (arrayidx46_i_i50743_mux_s) IS
            WHEN "0" => arrayidx46_i_i50743_mux_q <= in_arrayidx46_i_i50743_1;
            WHEN "1" => arrayidx46_i_i50743_mux_q <= in_arrayidx46_i_i50743_0;
            WHEN OTHERS => arrayidx46_i_i50743_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx46_i_i50743(GPOUT,124)
    out_arrayidx46_i_i50743 <= arrayidx46_i_i50743_mux_q;

    -- arrayidx4_i_i12686_mux(MUX,17)
    arrayidx4_i_i12686_mux_s <= in_valid_in_0;
    arrayidx4_i_i12686_mux_combproc: PROCESS (arrayidx4_i_i12686_mux_s, in_arrayidx4_i_i12686_1, in_arrayidx4_i_i12686_0)
    BEGIN
        CASE (arrayidx4_i_i12686_mux_s) IS
            WHEN "0" => arrayidx4_i_i12686_mux_q <= in_arrayidx4_i_i12686_1;
            WHEN "1" => arrayidx4_i_i12686_mux_q <= in_arrayidx4_i_i12686_0;
            WHEN OTHERS => arrayidx4_i_i12686_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx4_i_i12686(GPOUT,125)
    out_arrayidx4_i_i12686 <= arrayidx4_i_i12686_mux_q;

    -- arrayidx6_i_i14688_mux(MUX,18)
    arrayidx6_i_i14688_mux_s <= in_valid_in_0;
    arrayidx6_i_i14688_mux_combproc: PROCESS (arrayidx6_i_i14688_mux_s, in_arrayidx6_i_i14688_1, in_arrayidx6_i_i14688_0)
    BEGIN
        CASE (arrayidx6_i_i14688_mux_s) IS
            WHEN "0" => arrayidx6_i_i14688_mux_q <= in_arrayidx6_i_i14688_1;
            WHEN "1" => arrayidx6_i_i14688_mux_q <= in_arrayidx6_i_i14688_0;
            WHEN OTHERS => arrayidx6_i_i14688_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx6_i_i14688(GPOUT,126)
    out_arrayidx6_i_i14688 <= arrayidx6_i_i14688_mux_q;

    -- c0_exe1102_mux(MUX,19)
    c0_exe1102_mux_s <= in_valid_in_0;
    c0_exe1102_mux_combproc: PROCESS (c0_exe1102_mux_s, in_c0_exe1102_1, in_c0_exe1102_0)
    BEGIN
        CASE (c0_exe1102_mux_s) IS
            WHEN "0" => c0_exe1102_mux_q <= in_c0_exe1102_1;
            WHEN "1" => c0_exe1102_mux_q <= in_c0_exe1102_0;
            WHEN OTHERS => c0_exe1102_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1102(GPOUT,127)
    out_c0_exe1102 <= c0_exe1102_mux_q;

    -- fpgaindvars_iv_mux(MUX,20)
    fpgaindvars_iv_mux_s <= in_valid_in_0;
    fpgaindvars_iv_mux_combproc: PROCESS (fpgaindvars_iv_mux_s, in_fpgaindvars_iv_1, in_fpgaindvars_iv_0)
    BEGIN
        CASE (fpgaindvars_iv_mux_s) IS
            WHEN "0" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_1;
            WHEN "1" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_0;
            WHEN OTHERS => fpgaindvars_iv_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv(GPOUT,128)
    out_fpgaindvars_iv <= fpgaindvars_iv_mux_q;

    -- global_id_0191_mux(MUX,21)
    global_id_0191_mux_s <= in_valid_in_0;
    global_id_0191_mux_combproc: PROCESS (global_id_0191_mux_s, in_global_id_0191_1, in_global_id_0191_0)
    BEGIN
        CASE (global_id_0191_mux_s) IS
            WHEN "0" => global_id_0191_mux_q <= in_global_id_0191_1;
            WHEN "1" => global_id_0191_mux_q <= in_global_id_0191_0;
            WHEN OTHERS => global_id_0191_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_global_id_0191(GPOUT,129)
    out_global_id_0191 <= global_id_0191_mux_q;

    -- l_grpid_02_mux(MUX,109)
    l_grpid_02_mux_s <= in_valid_in_0;
    l_grpid_02_mux_combproc: PROCESS (l_grpid_02_mux_s, in_l_grpid_02_1, in_l_grpid_02_0)
    BEGIN
        CASE (l_grpid_02_mux_s) IS
            WHEN "0" => l_grpid_02_mux_q <= in_l_grpid_02_1;
            WHEN "1" => l_grpid_02_mux_q <= in_l_grpid_02_0;
            WHEN OTHERS => l_grpid_02_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_02(GPOUT,130)
    out_l_grpid_02 <= l_grpid_02_mux_q;

    -- r_0_i1_ph_mux(MUX,155)
    r_0_i1_ph_mux_s <= in_valid_in_0;
    r_0_i1_ph_mux_combproc: PROCESS (r_0_i1_ph_mux_s, in_r_0_i1_ph_1, in_r_0_i1_ph_0)
    BEGIN
        CASE (r_0_i1_ph_mux_s) IS
            WHEN "0" => r_0_i1_ph_mux_q <= in_r_0_i1_ph_1;
            WHEN "1" => r_0_i1_ph_mux_q <= in_r_0_i1_ph_0;
            WHEN OTHERS => r_0_i1_ph_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_r_0_i1_ph(GPOUT,131)
    out_r_0_i1_ph <= r_0_i1_ph_mux_q;

    -- scalarizer_01218_mux(MUX,156)
    scalarizer_01218_mux_s <= in_valid_in_0;
    scalarizer_01218_mux_combproc: PROCESS (scalarizer_01218_mux_s, in_scalarizer_01218_1, in_scalarizer_01218_0)
    BEGIN
        CASE (scalarizer_01218_mux_s) IS
            WHEN "0" => scalarizer_01218_mux_q <= in_scalarizer_01218_1;
            WHEN "1" => scalarizer_01218_mux_q <= in_scalarizer_01218_0;
            WHEN OTHERS => scalarizer_01218_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01218(GPOUT,132)
    out_scalarizer_01218 <= scalarizer_01218_mux_q;

    -- scalarizer_01220_mux(MUX,157)
    scalarizer_01220_mux_s <= in_valid_in_0;
    scalarizer_01220_mux_combproc: PROCESS (scalarizer_01220_mux_s, in_scalarizer_01220_1, in_scalarizer_01220_0)
    BEGIN
        CASE (scalarizer_01220_mux_s) IS
            WHEN "0" => scalarizer_01220_mux_q <= in_scalarizer_01220_1;
            WHEN "1" => scalarizer_01220_mux_q <= in_scalarizer_01220_0;
            WHEN OTHERS => scalarizer_01220_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01220(GPOUT,133)
    out_scalarizer_01220 <= scalarizer_01220_mux_q;

    -- scalarizer_01222_mux(MUX,158)
    scalarizer_01222_mux_s <= in_valid_in_0;
    scalarizer_01222_mux_combproc: PROCESS (scalarizer_01222_mux_s, in_scalarizer_01222_1, in_scalarizer_01222_0)
    BEGIN
        CASE (scalarizer_01222_mux_s) IS
            WHEN "0" => scalarizer_01222_mux_q <= in_scalarizer_01222_1;
            WHEN "1" => scalarizer_01222_mux_q <= in_scalarizer_01222_0;
            WHEN OTHERS => scalarizer_01222_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01222(GPOUT,134)
    out_scalarizer_01222 <= scalarizer_01222_mux_q;

    -- scalarizer_01224_mux(MUX,159)
    scalarizer_01224_mux_s <= in_valid_in_0;
    scalarizer_01224_mux_combproc: PROCESS (scalarizer_01224_mux_s, in_scalarizer_01224_1, in_scalarizer_01224_0)
    BEGIN
        CASE (scalarizer_01224_mux_s) IS
            WHEN "0" => scalarizer_01224_mux_q <= in_scalarizer_01224_1;
            WHEN "1" => scalarizer_01224_mux_q <= in_scalarizer_01224_0;
            WHEN OTHERS => scalarizer_01224_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01224(GPOUT,135)
    out_scalarizer_01224 <= scalarizer_01224_mux_q;

    -- scalarizer_01226_mux(MUX,160)
    scalarizer_01226_mux_s <= in_valid_in_0;
    scalarizer_01226_mux_combproc: PROCESS (scalarizer_01226_mux_s, in_scalarizer_01226_1, in_scalarizer_01226_0)
    BEGIN
        CASE (scalarizer_01226_mux_s) IS
            WHEN "0" => scalarizer_01226_mux_q <= in_scalarizer_01226_1;
            WHEN "1" => scalarizer_01226_mux_q <= in_scalarizer_01226_0;
            WHEN OTHERS => scalarizer_01226_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01226(GPOUT,136)
    out_scalarizer_01226 <= scalarizer_01226_mux_q;

    -- scalarizer_01228_mux(MUX,161)
    scalarizer_01228_mux_s <= in_valid_in_0;
    scalarizer_01228_mux_combproc: PROCESS (scalarizer_01228_mux_s, in_scalarizer_01228_1, in_scalarizer_01228_0)
    BEGIN
        CASE (scalarizer_01228_mux_s) IS
            WHEN "0" => scalarizer_01228_mux_q <= in_scalarizer_01228_1;
            WHEN "1" => scalarizer_01228_mux_q <= in_scalarizer_01228_0;
            WHEN OTHERS => scalarizer_01228_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01228(GPOUT,137)
    out_scalarizer_01228 <= scalarizer_01228_mux_q;

    -- scalarizer_01230_mux(MUX,162)
    scalarizer_01230_mux_s <= in_valid_in_0;
    scalarizer_01230_mux_combproc: PROCESS (scalarizer_01230_mux_s, in_scalarizer_01230_1, in_scalarizer_01230_0)
    BEGIN
        CASE (scalarizer_01230_mux_s) IS
            WHEN "0" => scalarizer_01230_mux_q <= in_scalarizer_01230_1;
            WHEN "1" => scalarizer_01230_mux_q <= in_scalarizer_01230_0;
            WHEN OTHERS => scalarizer_01230_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01230(GPOUT,138)
    out_scalarizer_01230 <= scalarizer_01230_mux_q;

    -- scalarizer_01232_mux(MUX,163)
    scalarizer_01232_mux_s <= in_valid_in_0;
    scalarizer_01232_mux_combproc: PROCESS (scalarizer_01232_mux_s, in_scalarizer_01232_1, in_scalarizer_01232_0)
    BEGIN
        CASE (scalarizer_01232_mux_s) IS
            WHEN "0" => scalarizer_01232_mux_q <= in_scalarizer_01232_1;
            WHEN "1" => scalarizer_01232_mux_q <= in_scalarizer_01232_0;
            WHEN OTHERS => scalarizer_01232_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01232(GPOUT,139)
    out_scalarizer_01232 <= scalarizer_01232_mux_q;

    -- scalarizer_11219_mux(MUX,164)
    scalarizer_11219_mux_s <= in_valid_in_0;
    scalarizer_11219_mux_combproc: PROCESS (scalarizer_11219_mux_s, in_scalarizer_11219_1, in_scalarizer_11219_0)
    BEGIN
        CASE (scalarizer_11219_mux_s) IS
            WHEN "0" => scalarizer_11219_mux_q <= in_scalarizer_11219_1;
            WHEN "1" => scalarizer_11219_mux_q <= in_scalarizer_11219_0;
            WHEN OTHERS => scalarizer_11219_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11219(GPOUT,140)
    out_scalarizer_11219 <= scalarizer_11219_mux_q;

    -- scalarizer_11221_mux(MUX,165)
    scalarizer_11221_mux_s <= in_valid_in_0;
    scalarizer_11221_mux_combproc: PROCESS (scalarizer_11221_mux_s, in_scalarizer_11221_1, in_scalarizer_11221_0)
    BEGIN
        CASE (scalarizer_11221_mux_s) IS
            WHEN "0" => scalarizer_11221_mux_q <= in_scalarizer_11221_1;
            WHEN "1" => scalarizer_11221_mux_q <= in_scalarizer_11221_0;
            WHEN OTHERS => scalarizer_11221_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11221(GPOUT,141)
    out_scalarizer_11221 <= scalarizer_11221_mux_q;

    -- scalarizer_11223_mux(MUX,166)
    scalarizer_11223_mux_s <= in_valid_in_0;
    scalarizer_11223_mux_combproc: PROCESS (scalarizer_11223_mux_s, in_scalarizer_11223_1, in_scalarizer_11223_0)
    BEGIN
        CASE (scalarizer_11223_mux_s) IS
            WHEN "0" => scalarizer_11223_mux_q <= in_scalarizer_11223_1;
            WHEN "1" => scalarizer_11223_mux_q <= in_scalarizer_11223_0;
            WHEN OTHERS => scalarizer_11223_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11223(GPOUT,142)
    out_scalarizer_11223 <= scalarizer_11223_mux_q;

    -- scalarizer_11225_mux(MUX,167)
    scalarizer_11225_mux_s <= in_valid_in_0;
    scalarizer_11225_mux_combproc: PROCESS (scalarizer_11225_mux_s, in_scalarizer_11225_1, in_scalarizer_11225_0)
    BEGIN
        CASE (scalarizer_11225_mux_s) IS
            WHEN "0" => scalarizer_11225_mux_q <= in_scalarizer_11225_1;
            WHEN "1" => scalarizer_11225_mux_q <= in_scalarizer_11225_0;
            WHEN OTHERS => scalarizer_11225_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11225(GPOUT,143)
    out_scalarizer_11225 <= scalarizer_11225_mux_q;

    -- scalarizer_11227_mux(MUX,168)
    scalarizer_11227_mux_s <= in_valid_in_0;
    scalarizer_11227_mux_combproc: PROCESS (scalarizer_11227_mux_s, in_scalarizer_11227_1, in_scalarizer_11227_0)
    BEGIN
        CASE (scalarizer_11227_mux_s) IS
            WHEN "0" => scalarizer_11227_mux_q <= in_scalarizer_11227_1;
            WHEN "1" => scalarizer_11227_mux_q <= in_scalarizer_11227_0;
            WHEN OTHERS => scalarizer_11227_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11227(GPOUT,144)
    out_scalarizer_11227 <= scalarizer_11227_mux_q;

    -- scalarizer_11229_mux(MUX,169)
    scalarizer_11229_mux_s <= in_valid_in_0;
    scalarizer_11229_mux_combproc: PROCESS (scalarizer_11229_mux_s, in_scalarizer_11229_1, in_scalarizer_11229_0)
    BEGIN
        CASE (scalarizer_11229_mux_s) IS
            WHEN "0" => scalarizer_11229_mux_q <= in_scalarizer_11229_1;
            WHEN "1" => scalarizer_11229_mux_q <= in_scalarizer_11229_0;
            WHEN OTHERS => scalarizer_11229_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11229(GPOUT,145)
    out_scalarizer_11229 <= scalarizer_11229_mux_q;

    -- scalarizer_11231_mux(MUX,170)
    scalarizer_11231_mux_s <= in_valid_in_0;
    scalarizer_11231_mux_combproc: PROCESS (scalarizer_11231_mux_s, in_scalarizer_11231_1, in_scalarizer_11231_0)
    BEGIN
        CASE (scalarizer_11231_mux_s) IS
            WHEN "0" => scalarizer_11231_mux_q <= in_scalarizer_11231_1;
            WHEN "1" => scalarizer_11231_mux_q <= in_scalarizer_11231_0;
            WHEN OTHERS => scalarizer_11231_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11231(GPOUT,146)
    out_scalarizer_11231 <= scalarizer_11231_mux_q;

    -- scalarizer_11233_mux(MUX,171)
    scalarizer_11233_mux_s <= in_valid_in_0;
    scalarizer_11233_mux_combproc: PROCESS (scalarizer_11233_mux_s, in_scalarizer_11233_1, in_scalarizer_11233_0)
    BEGIN
        CASE (scalarizer_11233_mux_s) IS
            WHEN "0" => scalarizer_11233_mux_q <= in_scalarizer_11233_1;
            WHEN "1" => scalarizer_11233_mux_q <= in_scalarizer_11233_0;
            WHEN OTHERS => scalarizer_11233_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11233(GPOUT,147)
    out_scalarizer_11233 <= scalarizer_11233_mux_q;

    -- valid_or(LOGICAL,178)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,172)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,148)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,173)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,149)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- state_10_2_cast185_mux(MUX,174)
    state_10_2_cast185_mux_s <= in_valid_in_0;
    state_10_2_cast185_mux_combproc: PROCESS (state_10_2_cast185_mux_s, in_state_10_2_cast185_1, in_state_10_2_cast185_0)
    BEGIN
        CASE (state_10_2_cast185_mux_s) IS
            WHEN "0" => state_10_2_cast185_mux_q <= in_state_10_2_cast185_1;
            WHEN "1" => state_10_2_cast185_mux_q <= in_state_10_2_cast185_0;
            WHEN OTHERS => state_10_2_cast185_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_10_2_cast185(GPOUT,150)
    out_state_10_2_cast185 <= state_10_2_cast185_mux_q;

    -- state_11_2_cast187_mux(MUX,175)
    state_11_2_cast187_mux_s <= in_valid_in_0;
    state_11_2_cast187_mux_combproc: PROCESS (state_11_2_cast187_mux_s, in_state_11_2_cast187_1, in_state_11_2_cast187_0)
    BEGIN
        CASE (state_11_2_cast187_mux_s) IS
            WHEN "0" => state_11_2_cast187_mux_q <= in_state_11_2_cast187_1;
            WHEN "1" => state_11_2_cast187_mux_q <= in_state_11_2_cast187_0;
            WHEN OTHERS => state_11_2_cast187_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_11_2_cast187(GPOUT,151)
    out_state_11_2_cast187 <= state_11_2_cast187_mux_q;

    -- state_8_2_cast181_mux(MUX,176)
    state_8_2_cast181_mux_s <= in_valid_in_0;
    state_8_2_cast181_mux_combproc: PROCESS (state_8_2_cast181_mux_s, in_state_8_2_cast181_1, in_state_8_2_cast181_0)
    BEGIN
        CASE (state_8_2_cast181_mux_s) IS
            WHEN "0" => state_8_2_cast181_mux_q <= in_state_8_2_cast181_1;
            WHEN "1" => state_8_2_cast181_mux_q <= in_state_8_2_cast181_0;
            WHEN OTHERS => state_8_2_cast181_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_8_2_cast181(GPOUT,152)
    out_state_8_2_cast181 <= state_8_2_cast181_mux_q;

    -- state_9_2_cast183_mux(MUX,177)
    state_9_2_cast183_mux_s <= in_valid_in_0;
    state_9_2_cast183_mux_combproc: PROCESS (state_9_2_cast183_mux_s, in_state_9_2_cast183_1, in_state_9_2_cast183_0)
    BEGIN
        CASE (state_9_2_cast183_mux_s) IS
            WHEN "0" => state_9_2_cast183_mux_q <= in_state_9_2_cast183_1;
            WHEN "1" => state_9_2_cast183_mux_q <= in_state_9_2_cast183_0;
            WHEN OTHERS => state_9_2_cast183_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_9_2_cast183(GPOUT,153)
    out_state_9_2_cast183 <= state_9_2_cast183_mux_q;

    -- out_valid_out(GPOUT,154)
    out_valid_out <= valid_or_q;

END normal;
