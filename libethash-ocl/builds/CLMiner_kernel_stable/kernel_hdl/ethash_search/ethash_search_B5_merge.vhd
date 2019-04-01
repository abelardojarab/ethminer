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

-- VHDL created from ethash_search_B5_merge
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

entity ethash_search_B5_merge is
    port (
        in_arrayidx36_2_RM164_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx45_RM162_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe1104_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2109_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3113_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4117_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp23156_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23_xor158_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv12135_0 : in std_logic_vector(3 downto 0);  -- ufix4
        in_global_id_0193_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908153_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_idxprom80_RM167_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_04_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr10_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext160_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_scalarizer_0100163_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100373_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100583_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100793_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173137_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175141_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177145_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179149_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099323_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099533_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099743_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099953_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0xor1200168_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100058_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100268_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100478_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100688_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100898_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174139_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176143_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178147_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180151_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199428_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199638_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199848_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1xor1201169_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2xor170_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3xor171_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_0_0_cast121_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast124_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast127_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast130_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast133_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_arrayidx36_2_RM164 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx45_RM162 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1104 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2109 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3113 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4117 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp23156 : out std_logic_vector(0 downto 0);  -- ufix1
        out_cmp23_xor158 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv12135 : out std_logic_vector(3 downto 0);  -- ufix4
        out_global_id_0193 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i18_0908153 : out std_logic_vector(31 downto 0);  -- ufix32
        out_idxprom80_RM167 : out std_logic_vector(63 downto 0);  -- ufix64
        out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext160 : out std_logic_vector(63 downto 0);  -- ufix64
        out_scalarizer_0100163 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100373 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100583 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100793 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01173137 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01175141 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01177145 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01179149 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099323 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099533 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099743 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099953 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0xor1200168 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100058 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100268 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100478 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100688 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100898 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11174139 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11176143 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11178147 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11180151 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199428 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199638 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199848 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1xor1201169 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_2xor170 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_3xor171 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast121 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast124 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast127 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast130 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast133 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B5_merge;

architecture normal of ethash_search_B5_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_arrayidx36_2_RM164(GPOUT,52)
    out_arrayidx36_2_RM164 <= in_arrayidx36_2_RM164_0;

    -- out_arrayidx45_RM162(GPOUT,53)
    out_arrayidx45_RM162 <= in_arrayidx45_RM162_0;

    -- out_c0_exe1104(GPOUT,54)
    out_c0_exe1104 <= in_c0_exe1104_0;

    -- out_c0_exe2109(GPOUT,55)
    out_c0_exe2109 <= in_c0_exe2109_0;

    -- out_c0_exe3113(GPOUT,56)
    out_c0_exe3113 <= in_c0_exe3113_0;

    -- out_c0_exe4117(GPOUT,57)
    out_c0_exe4117 <= in_c0_exe4117_0;

    -- out_cmp23156(GPOUT,58)
    out_cmp23156 <= in_cmp23156_0;

    -- out_cmp23_xor158(GPOUT,59)
    out_cmp23_xor158 <= in_cmp23_xor158_0;

    -- out_fpgaindvars_iv12135(GPOUT,60)
    out_fpgaindvars_iv12135 <= in_fpgaindvars_iv12135_0;

    -- out_global_id_0193(GPOUT,61)
    out_global_id_0193 <= in_global_id_0193_0;

    -- out_i18_0908153(GPOUT,62)
    out_i18_0908153 <= in_i18_0908153_0;

    -- out_idxprom80_RM167(GPOUT,63)
    out_idxprom80_RM167 <= in_idxprom80_RM167_0;

    -- out_l_grpid_04(GPOUT,64)
    out_l_grpid_04 <= in_l_grpid_04_0;

    -- out_l_grpid_0_addr10(GPOUT,65)
    out_l_grpid_0_addr10 <= in_l_grpid_0_addr10_0;

    -- out_l_grpid_0_addr_zext160(GPOUT,66)
    out_l_grpid_0_addr_zext160 <= in_l_grpid_0_addr_zext160_0;

    -- out_scalarizer_0100163(GPOUT,67)
    out_scalarizer_0100163 <= in_scalarizer_0100163_0;

    -- out_scalarizer_0100373(GPOUT,68)
    out_scalarizer_0100373 <= in_scalarizer_0100373_0;

    -- out_scalarizer_0100583(GPOUT,69)
    out_scalarizer_0100583 <= in_scalarizer_0100583_0;

    -- out_scalarizer_0100793(GPOUT,70)
    out_scalarizer_0100793 <= in_scalarizer_0100793_0;

    -- out_scalarizer_01173137(GPOUT,71)
    out_scalarizer_01173137 <= in_scalarizer_01173137_0;

    -- out_scalarizer_01175141(GPOUT,72)
    out_scalarizer_01175141 <= in_scalarizer_01175141_0;

    -- out_scalarizer_01177145(GPOUT,73)
    out_scalarizer_01177145 <= in_scalarizer_01177145_0;

    -- out_scalarizer_01179149(GPOUT,74)
    out_scalarizer_01179149 <= in_scalarizer_01179149_0;

    -- out_scalarizer_099323(GPOUT,75)
    out_scalarizer_099323 <= in_scalarizer_099323_0;

    -- out_scalarizer_099533(GPOUT,76)
    out_scalarizer_099533 <= in_scalarizer_099533_0;

    -- out_scalarizer_099743(GPOUT,77)
    out_scalarizer_099743 <= in_scalarizer_099743_0;

    -- out_scalarizer_099953(GPOUT,78)
    out_scalarizer_099953 <= in_scalarizer_099953_0;

    -- out_scalarizer_0xor1200168(GPOUT,79)
    out_scalarizer_0xor1200168 <= in_scalarizer_0xor1200168_0;

    -- out_scalarizer_1100058(GPOUT,80)
    out_scalarizer_1100058 <= in_scalarizer_1100058_0;

    -- out_scalarizer_1100268(GPOUT,81)
    out_scalarizer_1100268 <= in_scalarizer_1100268_0;

    -- out_scalarizer_1100478(GPOUT,82)
    out_scalarizer_1100478 <= in_scalarizer_1100478_0;

    -- out_scalarizer_1100688(GPOUT,83)
    out_scalarizer_1100688 <= in_scalarizer_1100688_0;

    -- out_scalarizer_1100898(GPOUT,84)
    out_scalarizer_1100898 <= in_scalarizer_1100898_0;

    -- out_scalarizer_11174139(GPOUT,85)
    out_scalarizer_11174139 <= in_scalarizer_11174139_0;

    -- out_scalarizer_11176143(GPOUT,86)
    out_scalarizer_11176143 <= in_scalarizer_11176143_0;

    -- out_scalarizer_11178147(GPOUT,87)
    out_scalarizer_11178147 <= in_scalarizer_11178147_0;

    -- out_scalarizer_11180151(GPOUT,88)
    out_scalarizer_11180151 <= in_scalarizer_11180151_0;

    -- out_scalarizer_199428(GPOUT,89)
    out_scalarizer_199428 <= in_scalarizer_199428_0;

    -- out_scalarizer_199638(GPOUT,90)
    out_scalarizer_199638 <= in_scalarizer_199638_0;

    -- out_scalarizer_199848(GPOUT,91)
    out_scalarizer_199848 <= in_scalarizer_199848_0;

    -- out_scalarizer_1xor1201169(GPOUT,92)
    out_scalarizer_1xor1201169 <= in_scalarizer_1xor1201169_0;

    -- out_scalarizer_2xor170(GPOUT,93)
    out_scalarizer_2xor170 <= in_scalarizer_2xor170_0;

    -- out_scalarizer_3xor171(GPOUT,94)
    out_scalarizer_3xor171 <= in_scalarizer_3xor171_0;

    -- stall_out(LOGICAL,102)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,95)
    out_stall_out_0 <= stall_out_q;

    -- out_state_0_0_cast121(GPOUT,96)
    out_state_0_0_cast121 <= in_state_0_0_cast121_0;

    -- out_state_4_0_cast124(GPOUT,97)
    out_state_4_0_cast124 <= in_state_4_0_cast124_0;

    -- out_state_5_0_cast127(GPOUT,98)
    out_state_5_0_cast127 <= in_state_5_0_cast127_0;

    -- out_state_6_0_cast130(GPOUT,99)
    out_state_6_0_cast130 <= in_state_6_0_cast130_0;

    -- out_state_7_0_cast133(GPOUT,100)
    out_state_7_0_cast133 <= in_state_7_0_cast133_0;

    -- out_valid_out(GPOUT,101)
    out_valid_out <= in_valid_in_0;

END normal;
