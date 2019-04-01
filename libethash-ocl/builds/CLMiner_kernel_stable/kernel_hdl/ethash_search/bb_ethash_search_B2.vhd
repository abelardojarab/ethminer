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

-- VHDL created from bb_ethash_search_B2
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

entity bb_ethash_search_B2 is
    port (
        in_c0_exe1107_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2111_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3115_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4119_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0196_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_07_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr12_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100166_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100376_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100586_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100796_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_014_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_098716_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_098918_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099120_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099326_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099536_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099746_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099956_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100061_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100271_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100481_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100691_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008101_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_115_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_198817_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199019_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199221_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199431_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199641_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199851_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1107 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2111 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3115 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4119 : out std_logic_vector(63 downto 0);  -- ufix64
        out_global_id_0196 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_07 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100166 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100376 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100586 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100796 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_014 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_098716 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_098918 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099120 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099326 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099536 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099746 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099956 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100061 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100271 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100481 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100691 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11008101 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_198817 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199019 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199221 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199431 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199641 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199851 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B2;

architecture normal of bb_ethash_search_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_search_B2_stall_region is
        port (
            in_c0_exe1107 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2111 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3115 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4119 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0196 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_07 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100166 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100376 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100586 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100796 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_014 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_098716 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_098918 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099120 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099326 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099536 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099746 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099956 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100061 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100271 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100481 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100691 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008101 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_115 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_198817 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199019 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199221 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199431 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199641 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199851 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1107 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2111 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3115 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4119 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0196 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_07 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100166 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100376 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100586 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100796 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_098716 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_098918 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099120 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099326 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099536 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099746 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099956 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100061 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100271 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100481 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100691 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008101 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_198817 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199019 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199431 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199641 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199851 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B2_branch is
        port (
            in_c0_exe1107 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2111 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3115 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4119 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0196 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_07 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100166 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100376 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100586 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100796 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_014 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_098716 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_098918 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099120 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099326 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099536 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099746 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099956 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100061 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100271 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100481 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100691 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008101 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_115 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_198817 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199019 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199221 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199431 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199641 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199851 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1107 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2111 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3115 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4119 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0196 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_07 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100166 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100376 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100586 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100796 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_098716 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_098918 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099120 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099326 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099536 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099746 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099956 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100061 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100271 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100481 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100691 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008101 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_198817 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199019 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199431 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199641 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199851 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B2_merge is
        port (
            in_c0_exe1107_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2111_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3115_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4119_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0196_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_07_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr12_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100166_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100376_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100586_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100796_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_014_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_098716_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_098918_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099120_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099326_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099536_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099746_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099956_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100061_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100271_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100481_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100691_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008101_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_198817_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199019_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199221_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199431_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199641_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199851_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1107 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2111 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3115 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4119 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0196 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_07 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100166 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100376 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100586 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100796 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_098716 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_098918 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099120 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099326 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099536 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099746 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099956 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100061 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100271 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100481 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100691 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008101 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_198817 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199019 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199431 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199641 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199851 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_ethash_search_B2_stall_region_out_c0_exe1107 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B2_stall_region_out_c0_exe2111 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_stall_region_out_c0_exe3115 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_stall_region_out_c0_exe4119 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_stall_region_out_global_id_0196 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_l_grpid_07 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_l_grpid_0_addr12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_0100166 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_0100376 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_0100586 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_0100796 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_098716 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_098918 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_099120 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_099326 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_099536 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_099746 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_099956 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_1100061 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_1100271 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_1100481 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_1100691 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_11008101 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_198817 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_199019 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_199221 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_199431 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_199641 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_scalarizer_199851 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B2_stall_region_out_state_0_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_stall_region_out_state_4_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_stall_region_out_state_5_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_stall_region_out_state_6_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_stall_region_out_state_7_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B2_branch_out_c0_exe1107 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B2_branch_out_c0_exe2111 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_branch_out_c0_exe3115 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_branch_out_c0_exe4119 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_branch_out_global_id_0196 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_l_grpid_07 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_l_grpid_0_addr12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_0100166 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_0100376 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_0100586 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_0100796 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_098716 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_098918 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_099120 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_099326 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_099536 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_099746 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_099956 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_1100061 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_1100271 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_1100481 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_1100691 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_11008101 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_115 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_198817 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_199019 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_199221 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_199431 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_199641 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_scalarizer_199851 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B2_branch_out_state_0_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_branch_out_state_4_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_branch_out_state_5_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_branch_out_state_6_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_branch_out_state_7_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B2_merge_out_c0_exe1107 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B2_merge_out_c0_exe2111 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_merge_out_c0_exe3115 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_merge_out_c0_exe4119 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B2_merge_out_global_id_0196 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_l_grpid_07 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_l_grpid_0_addr12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_0100166 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_0100376 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_0100586 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_0100796 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_098716 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_098918 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_099120 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_099326 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_099536 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_099746 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_099956 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_1100061 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_1100271 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_1100481 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_1100691 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_11008101 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_115 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_198817 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_199019 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_199221 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_199431 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_199641 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_scalarizer_199851 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_search_B2_merge(BLACKBOX,4)
    theethash_search_B2_merge : ethash_search_B2_merge
    PORT MAP (
        in_c0_exe1107_0 => in_c0_exe1107_0,
        in_c0_exe2111_0 => in_c0_exe2111_0,
        in_c0_exe3115_0 => in_c0_exe3115_0,
        in_c0_exe4119_0 => in_c0_exe4119_0,
        in_global_id_0196_0 => in_global_id_0196_0,
        in_l_grpid_07_0 => in_l_grpid_07_0,
        in_l_grpid_0_addr12_0 => in_l_grpid_0_addr12_0,
        in_scalarizer_0100166_0 => in_scalarizer_0100166_0,
        in_scalarizer_0100376_0 => in_scalarizer_0100376_0,
        in_scalarizer_0100586_0 => in_scalarizer_0100586_0,
        in_scalarizer_0100796_0 => in_scalarizer_0100796_0,
        in_scalarizer_014_0 => in_scalarizer_014_0,
        in_scalarizer_098716_0 => in_scalarizer_098716_0,
        in_scalarizer_098918_0 => in_scalarizer_098918_0,
        in_scalarizer_099120_0 => in_scalarizer_099120_0,
        in_scalarizer_099326_0 => in_scalarizer_099326_0,
        in_scalarizer_099536_0 => in_scalarizer_099536_0,
        in_scalarizer_099746_0 => in_scalarizer_099746_0,
        in_scalarizer_099956_0 => in_scalarizer_099956_0,
        in_scalarizer_1100061_0 => in_scalarizer_1100061_0,
        in_scalarizer_1100271_0 => in_scalarizer_1100271_0,
        in_scalarizer_1100481_0 => in_scalarizer_1100481_0,
        in_scalarizer_1100691_0 => in_scalarizer_1100691_0,
        in_scalarizer_11008101_0 => in_scalarizer_11008101_0,
        in_scalarizer_115_0 => in_scalarizer_115_0,
        in_scalarizer_198817_0 => in_scalarizer_198817_0,
        in_scalarizer_199019_0 => in_scalarizer_199019_0,
        in_scalarizer_199221_0 => in_scalarizer_199221_0,
        in_scalarizer_199431_0 => in_scalarizer_199431_0,
        in_scalarizer_199641_0 => in_scalarizer_199641_0,
        in_scalarizer_199851_0 => in_scalarizer_199851_0,
        in_stall_in => bb_ethash_search_B2_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exe1107 => ethash_search_B2_merge_out_c0_exe1107,
        out_c0_exe2111 => ethash_search_B2_merge_out_c0_exe2111,
        out_c0_exe3115 => ethash_search_B2_merge_out_c0_exe3115,
        out_c0_exe4119 => ethash_search_B2_merge_out_c0_exe4119,
        out_global_id_0196 => ethash_search_B2_merge_out_global_id_0196,
        out_l_grpid_07 => ethash_search_B2_merge_out_l_grpid_07,
        out_l_grpid_0_addr12 => ethash_search_B2_merge_out_l_grpid_0_addr12,
        out_scalarizer_0100166 => ethash_search_B2_merge_out_scalarizer_0100166,
        out_scalarizer_0100376 => ethash_search_B2_merge_out_scalarizer_0100376,
        out_scalarizer_0100586 => ethash_search_B2_merge_out_scalarizer_0100586,
        out_scalarizer_0100796 => ethash_search_B2_merge_out_scalarizer_0100796,
        out_scalarizer_014 => ethash_search_B2_merge_out_scalarizer_014,
        out_scalarizer_098716 => ethash_search_B2_merge_out_scalarizer_098716,
        out_scalarizer_098918 => ethash_search_B2_merge_out_scalarizer_098918,
        out_scalarizer_099120 => ethash_search_B2_merge_out_scalarizer_099120,
        out_scalarizer_099326 => ethash_search_B2_merge_out_scalarizer_099326,
        out_scalarizer_099536 => ethash_search_B2_merge_out_scalarizer_099536,
        out_scalarizer_099746 => ethash_search_B2_merge_out_scalarizer_099746,
        out_scalarizer_099956 => ethash_search_B2_merge_out_scalarizer_099956,
        out_scalarizer_1100061 => ethash_search_B2_merge_out_scalarizer_1100061,
        out_scalarizer_1100271 => ethash_search_B2_merge_out_scalarizer_1100271,
        out_scalarizer_1100481 => ethash_search_B2_merge_out_scalarizer_1100481,
        out_scalarizer_1100691 => ethash_search_B2_merge_out_scalarizer_1100691,
        out_scalarizer_11008101 => ethash_search_B2_merge_out_scalarizer_11008101,
        out_scalarizer_115 => ethash_search_B2_merge_out_scalarizer_115,
        out_scalarizer_198817 => ethash_search_B2_merge_out_scalarizer_198817,
        out_scalarizer_199019 => ethash_search_B2_merge_out_scalarizer_199019,
        out_scalarizer_199221 => ethash_search_B2_merge_out_scalarizer_199221,
        out_scalarizer_199431 => ethash_search_B2_merge_out_scalarizer_199431,
        out_scalarizer_199641 => ethash_search_B2_merge_out_scalarizer_199641,
        out_scalarizer_199851 => ethash_search_B2_merge_out_scalarizer_199851,
        out_stall_out_0 => ethash_search_B2_merge_out_stall_out_0,
        out_valid_out => ethash_search_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B2_stall_region(BLACKBOX,2)
    thebb_ethash_search_B2_stall_region : bb_ethash_search_B2_stall_region
    PORT MAP (
        in_c0_exe1107 => ethash_search_B2_merge_out_c0_exe1107,
        in_c0_exe2111 => ethash_search_B2_merge_out_c0_exe2111,
        in_c0_exe3115 => ethash_search_B2_merge_out_c0_exe3115,
        in_c0_exe4119 => ethash_search_B2_merge_out_c0_exe4119,
        in_global_id_0196 => ethash_search_B2_merge_out_global_id_0196,
        in_l_grpid_07 => ethash_search_B2_merge_out_l_grpid_07,
        in_l_grpid_0_addr12 => ethash_search_B2_merge_out_l_grpid_0_addr12,
        in_scalarizer_0100166 => ethash_search_B2_merge_out_scalarizer_0100166,
        in_scalarizer_0100376 => ethash_search_B2_merge_out_scalarizer_0100376,
        in_scalarizer_0100586 => ethash_search_B2_merge_out_scalarizer_0100586,
        in_scalarizer_0100796 => ethash_search_B2_merge_out_scalarizer_0100796,
        in_scalarizer_014 => ethash_search_B2_merge_out_scalarizer_014,
        in_scalarizer_098716 => ethash_search_B2_merge_out_scalarizer_098716,
        in_scalarizer_098918 => ethash_search_B2_merge_out_scalarizer_098918,
        in_scalarizer_099120 => ethash_search_B2_merge_out_scalarizer_099120,
        in_scalarizer_099326 => ethash_search_B2_merge_out_scalarizer_099326,
        in_scalarizer_099536 => ethash_search_B2_merge_out_scalarizer_099536,
        in_scalarizer_099746 => ethash_search_B2_merge_out_scalarizer_099746,
        in_scalarizer_099956 => ethash_search_B2_merge_out_scalarizer_099956,
        in_scalarizer_1100061 => ethash_search_B2_merge_out_scalarizer_1100061,
        in_scalarizer_1100271 => ethash_search_B2_merge_out_scalarizer_1100271,
        in_scalarizer_1100481 => ethash_search_B2_merge_out_scalarizer_1100481,
        in_scalarizer_1100691 => ethash_search_B2_merge_out_scalarizer_1100691,
        in_scalarizer_11008101 => ethash_search_B2_merge_out_scalarizer_11008101,
        in_scalarizer_115 => ethash_search_B2_merge_out_scalarizer_115,
        in_scalarizer_198817 => ethash_search_B2_merge_out_scalarizer_198817,
        in_scalarizer_199019 => ethash_search_B2_merge_out_scalarizer_199019,
        in_scalarizer_199221 => ethash_search_B2_merge_out_scalarizer_199221,
        in_scalarizer_199431 => ethash_search_B2_merge_out_scalarizer_199431,
        in_scalarizer_199641 => ethash_search_B2_merge_out_scalarizer_199641,
        in_scalarizer_199851 => ethash_search_B2_merge_out_scalarizer_199851,
        in_stall_in => ethash_search_B2_branch_out_stall_out,
        in_valid_in => ethash_search_B2_merge_out_valid_out,
        out_c0_exe1107 => bb_ethash_search_B2_stall_region_out_c0_exe1107,
        out_c0_exe2111 => bb_ethash_search_B2_stall_region_out_c0_exe2111,
        out_c0_exe3115 => bb_ethash_search_B2_stall_region_out_c0_exe3115,
        out_c0_exe4119 => bb_ethash_search_B2_stall_region_out_c0_exe4119,
        out_global_id_0196 => bb_ethash_search_B2_stall_region_out_global_id_0196,
        out_l_grpid_07 => bb_ethash_search_B2_stall_region_out_l_grpid_07,
        out_l_grpid_0_addr12 => bb_ethash_search_B2_stall_region_out_l_grpid_0_addr12,
        out_scalarizer_0100166 => bb_ethash_search_B2_stall_region_out_scalarizer_0100166,
        out_scalarizer_0100376 => bb_ethash_search_B2_stall_region_out_scalarizer_0100376,
        out_scalarizer_0100586 => bb_ethash_search_B2_stall_region_out_scalarizer_0100586,
        out_scalarizer_0100796 => bb_ethash_search_B2_stall_region_out_scalarizer_0100796,
        out_scalarizer_014 => bb_ethash_search_B2_stall_region_out_scalarizer_014,
        out_scalarizer_098716 => bb_ethash_search_B2_stall_region_out_scalarizer_098716,
        out_scalarizer_098918 => bb_ethash_search_B2_stall_region_out_scalarizer_098918,
        out_scalarizer_099120 => bb_ethash_search_B2_stall_region_out_scalarizer_099120,
        out_scalarizer_099326 => bb_ethash_search_B2_stall_region_out_scalarizer_099326,
        out_scalarizer_099536 => bb_ethash_search_B2_stall_region_out_scalarizer_099536,
        out_scalarizer_099746 => bb_ethash_search_B2_stall_region_out_scalarizer_099746,
        out_scalarizer_099956 => bb_ethash_search_B2_stall_region_out_scalarizer_099956,
        out_scalarizer_1100061 => bb_ethash_search_B2_stall_region_out_scalarizer_1100061,
        out_scalarizer_1100271 => bb_ethash_search_B2_stall_region_out_scalarizer_1100271,
        out_scalarizer_1100481 => bb_ethash_search_B2_stall_region_out_scalarizer_1100481,
        out_scalarizer_1100691 => bb_ethash_search_B2_stall_region_out_scalarizer_1100691,
        out_scalarizer_11008101 => bb_ethash_search_B2_stall_region_out_scalarizer_11008101,
        out_scalarizer_115 => bb_ethash_search_B2_stall_region_out_scalarizer_115,
        out_scalarizer_198817 => bb_ethash_search_B2_stall_region_out_scalarizer_198817,
        out_scalarizer_199019 => bb_ethash_search_B2_stall_region_out_scalarizer_199019,
        out_scalarizer_199221 => bb_ethash_search_B2_stall_region_out_scalarizer_199221,
        out_scalarizer_199431 => bb_ethash_search_B2_stall_region_out_scalarizer_199431,
        out_scalarizer_199641 => bb_ethash_search_B2_stall_region_out_scalarizer_199641,
        out_scalarizer_199851 => bb_ethash_search_B2_stall_region_out_scalarizer_199851,
        out_stall_out => bb_ethash_search_B2_stall_region_out_stall_out,
        out_state_0_0_cast => bb_ethash_search_B2_stall_region_out_state_0_0_cast,
        out_state_4_0_cast => bb_ethash_search_B2_stall_region_out_state_4_0_cast,
        out_state_5_0_cast => bb_ethash_search_B2_stall_region_out_state_5_0_cast,
        out_state_6_0_cast => bb_ethash_search_B2_stall_region_out_state_6_0_cast,
        out_state_7_0_cast => bb_ethash_search_B2_stall_region_out_state_7_0_cast,
        out_valid_out => bb_ethash_search_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B2_branch(BLACKBOX,3)
    theethash_search_B2_branch : ethash_search_B2_branch
    PORT MAP (
        in_c0_exe1107 => bb_ethash_search_B2_stall_region_out_c0_exe1107,
        in_c0_exe2111 => bb_ethash_search_B2_stall_region_out_c0_exe2111,
        in_c0_exe3115 => bb_ethash_search_B2_stall_region_out_c0_exe3115,
        in_c0_exe4119 => bb_ethash_search_B2_stall_region_out_c0_exe4119,
        in_global_id_0196 => bb_ethash_search_B2_stall_region_out_global_id_0196,
        in_l_grpid_07 => bb_ethash_search_B2_stall_region_out_l_grpid_07,
        in_l_grpid_0_addr12 => bb_ethash_search_B2_stall_region_out_l_grpid_0_addr12,
        in_scalarizer_0100166 => bb_ethash_search_B2_stall_region_out_scalarizer_0100166,
        in_scalarizer_0100376 => bb_ethash_search_B2_stall_region_out_scalarizer_0100376,
        in_scalarizer_0100586 => bb_ethash_search_B2_stall_region_out_scalarizer_0100586,
        in_scalarizer_0100796 => bb_ethash_search_B2_stall_region_out_scalarizer_0100796,
        in_scalarizer_014 => bb_ethash_search_B2_stall_region_out_scalarizer_014,
        in_scalarizer_098716 => bb_ethash_search_B2_stall_region_out_scalarizer_098716,
        in_scalarizer_098918 => bb_ethash_search_B2_stall_region_out_scalarizer_098918,
        in_scalarizer_099120 => bb_ethash_search_B2_stall_region_out_scalarizer_099120,
        in_scalarizer_099326 => bb_ethash_search_B2_stall_region_out_scalarizer_099326,
        in_scalarizer_099536 => bb_ethash_search_B2_stall_region_out_scalarizer_099536,
        in_scalarizer_099746 => bb_ethash_search_B2_stall_region_out_scalarizer_099746,
        in_scalarizer_099956 => bb_ethash_search_B2_stall_region_out_scalarizer_099956,
        in_scalarizer_1100061 => bb_ethash_search_B2_stall_region_out_scalarizer_1100061,
        in_scalarizer_1100271 => bb_ethash_search_B2_stall_region_out_scalarizer_1100271,
        in_scalarizer_1100481 => bb_ethash_search_B2_stall_region_out_scalarizer_1100481,
        in_scalarizer_1100691 => bb_ethash_search_B2_stall_region_out_scalarizer_1100691,
        in_scalarizer_11008101 => bb_ethash_search_B2_stall_region_out_scalarizer_11008101,
        in_scalarizer_115 => bb_ethash_search_B2_stall_region_out_scalarizer_115,
        in_scalarizer_198817 => bb_ethash_search_B2_stall_region_out_scalarizer_198817,
        in_scalarizer_199019 => bb_ethash_search_B2_stall_region_out_scalarizer_199019,
        in_scalarizer_199221 => bb_ethash_search_B2_stall_region_out_scalarizer_199221,
        in_scalarizer_199431 => bb_ethash_search_B2_stall_region_out_scalarizer_199431,
        in_scalarizer_199641 => bb_ethash_search_B2_stall_region_out_scalarizer_199641,
        in_scalarizer_199851 => bb_ethash_search_B2_stall_region_out_scalarizer_199851,
        in_stall_in_0 => in_stall_in_0,
        in_state_0_0_cast => bb_ethash_search_B2_stall_region_out_state_0_0_cast,
        in_state_4_0_cast => bb_ethash_search_B2_stall_region_out_state_4_0_cast,
        in_state_5_0_cast => bb_ethash_search_B2_stall_region_out_state_5_0_cast,
        in_state_6_0_cast => bb_ethash_search_B2_stall_region_out_state_6_0_cast,
        in_state_7_0_cast => bb_ethash_search_B2_stall_region_out_state_7_0_cast,
        in_valid_in => bb_ethash_search_B2_stall_region_out_valid_out,
        out_c0_exe1107 => ethash_search_B2_branch_out_c0_exe1107,
        out_c0_exe2111 => ethash_search_B2_branch_out_c0_exe2111,
        out_c0_exe3115 => ethash_search_B2_branch_out_c0_exe3115,
        out_c0_exe4119 => ethash_search_B2_branch_out_c0_exe4119,
        out_global_id_0196 => ethash_search_B2_branch_out_global_id_0196,
        out_l_grpid_07 => ethash_search_B2_branch_out_l_grpid_07,
        out_l_grpid_0_addr12 => ethash_search_B2_branch_out_l_grpid_0_addr12,
        out_scalarizer_0100166 => ethash_search_B2_branch_out_scalarizer_0100166,
        out_scalarizer_0100376 => ethash_search_B2_branch_out_scalarizer_0100376,
        out_scalarizer_0100586 => ethash_search_B2_branch_out_scalarizer_0100586,
        out_scalarizer_0100796 => ethash_search_B2_branch_out_scalarizer_0100796,
        out_scalarizer_014 => ethash_search_B2_branch_out_scalarizer_014,
        out_scalarizer_098716 => ethash_search_B2_branch_out_scalarizer_098716,
        out_scalarizer_098918 => ethash_search_B2_branch_out_scalarizer_098918,
        out_scalarizer_099120 => ethash_search_B2_branch_out_scalarizer_099120,
        out_scalarizer_099326 => ethash_search_B2_branch_out_scalarizer_099326,
        out_scalarizer_099536 => ethash_search_B2_branch_out_scalarizer_099536,
        out_scalarizer_099746 => ethash_search_B2_branch_out_scalarizer_099746,
        out_scalarizer_099956 => ethash_search_B2_branch_out_scalarizer_099956,
        out_scalarizer_1100061 => ethash_search_B2_branch_out_scalarizer_1100061,
        out_scalarizer_1100271 => ethash_search_B2_branch_out_scalarizer_1100271,
        out_scalarizer_1100481 => ethash_search_B2_branch_out_scalarizer_1100481,
        out_scalarizer_1100691 => ethash_search_B2_branch_out_scalarizer_1100691,
        out_scalarizer_11008101 => ethash_search_B2_branch_out_scalarizer_11008101,
        out_scalarizer_115 => ethash_search_B2_branch_out_scalarizer_115,
        out_scalarizer_198817 => ethash_search_B2_branch_out_scalarizer_198817,
        out_scalarizer_199019 => ethash_search_B2_branch_out_scalarizer_199019,
        out_scalarizer_199221 => ethash_search_B2_branch_out_scalarizer_199221,
        out_scalarizer_199431 => ethash_search_B2_branch_out_scalarizer_199431,
        out_scalarizer_199641 => ethash_search_B2_branch_out_scalarizer_199641,
        out_scalarizer_199851 => ethash_search_B2_branch_out_scalarizer_199851,
        out_stall_out => ethash_search_B2_branch_out_stall_out,
        out_state_0_0_cast => ethash_search_B2_branch_out_state_0_0_cast,
        out_state_4_0_cast => ethash_search_B2_branch_out_state_4_0_cast,
        out_state_5_0_cast => ethash_search_B2_branch_out_state_5_0_cast,
        out_state_6_0_cast => ethash_search_B2_branch_out_state_6_0_cast,
        out_state_7_0_cast => ethash_search_B2_branch_out_state_7_0_cast,
        out_valid_out_0 => ethash_search_B2_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe1107(GPOUT,41)
    out_c0_exe1107 <= ethash_search_B2_branch_out_c0_exe1107;

    -- out_c0_exe2111(GPOUT,42)
    out_c0_exe2111 <= ethash_search_B2_branch_out_c0_exe2111;

    -- out_c0_exe3115(GPOUT,43)
    out_c0_exe3115 <= ethash_search_B2_branch_out_c0_exe3115;

    -- out_c0_exe4119(GPOUT,44)
    out_c0_exe4119 <= ethash_search_B2_branch_out_c0_exe4119;

    -- out_global_id_0196(GPOUT,45)
    out_global_id_0196 <= ethash_search_B2_branch_out_global_id_0196;

    -- out_l_grpid_07(GPOUT,46)
    out_l_grpid_07 <= ethash_search_B2_branch_out_l_grpid_07;

    -- out_l_grpid_0_addr12(GPOUT,47)
    out_l_grpid_0_addr12 <= ethash_search_B2_branch_out_l_grpid_0_addr12;

    -- out_scalarizer_0100166(GPOUT,48)
    out_scalarizer_0100166 <= ethash_search_B2_branch_out_scalarizer_0100166;

    -- out_scalarizer_0100376(GPOUT,49)
    out_scalarizer_0100376 <= ethash_search_B2_branch_out_scalarizer_0100376;

    -- out_scalarizer_0100586(GPOUT,50)
    out_scalarizer_0100586 <= ethash_search_B2_branch_out_scalarizer_0100586;

    -- out_scalarizer_0100796(GPOUT,51)
    out_scalarizer_0100796 <= ethash_search_B2_branch_out_scalarizer_0100796;

    -- out_scalarizer_014(GPOUT,52)
    out_scalarizer_014 <= ethash_search_B2_branch_out_scalarizer_014;

    -- out_scalarizer_098716(GPOUT,53)
    out_scalarizer_098716 <= ethash_search_B2_branch_out_scalarizer_098716;

    -- out_scalarizer_098918(GPOUT,54)
    out_scalarizer_098918 <= ethash_search_B2_branch_out_scalarizer_098918;

    -- out_scalarizer_099120(GPOUT,55)
    out_scalarizer_099120 <= ethash_search_B2_branch_out_scalarizer_099120;

    -- out_scalarizer_099326(GPOUT,56)
    out_scalarizer_099326 <= ethash_search_B2_branch_out_scalarizer_099326;

    -- out_scalarizer_099536(GPOUT,57)
    out_scalarizer_099536 <= ethash_search_B2_branch_out_scalarizer_099536;

    -- out_scalarizer_099746(GPOUT,58)
    out_scalarizer_099746 <= ethash_search_B2_branch_out_scalarizer_099746;

    -- out_scalarizer_099956(GPOUT,59)
    out_scalarizer_099956 <= ethash_search_B2_branch_out_scalarizer_099956;

    -- out_scalarizer_1100061(GPOUT,60)
    out_scalarizer_1100061 <= ethash_search_B2_branch_out_scalarizer_1100061;

    -- out_scalarizer_1100271(GPOUT,61)
    out_scalarizer_1100271 <= ethash_search_B2_branch_out_scalarizer_1100271;

    -- out_scalarizer_1100481(GPOUT,62)
    out_scalarizer_1100481 <= ethash_search_B2_branch_out_scalarizer_1100481;

    -- out_scalarizer_1100691(GPOUT,63)
    out_scalarizer_1100691 <= ethash_search_B2_branch_out_scalarizer_1100691;

    -- out_scalarizer_11008101(GPOUT,64)
    out_scalarizer_11008101 <= ethash_search_B2_branch_out_scalarizer_11008101;

    -- out_scalarizer_115(GPOUT,65)
    out_scalarizer_115 <= ethash_search_B2_branch_out_scalarizer_115;

    -- out_scalarizer_198817(GPOUT,66)
    out_scalarizer_198817 <= ethash_search_B2_branch_out_scalarizer_198817;

    -- out_scalarizer_199019(GPOUT,67)
    out_scalarizer_199019 <= ethash_search_B2_branch_out_scalarizer_199019;

    -- out_scalarizer_199221(GPOUT,68)
    out_scalarizer_199221 <= ethash_search_B2_branch_out_scalarizer_199221;

    -- out_scalarizer_199431(GPOUT,69)
    out_scalarizer_199431 <= ethash_search_B2_branch_out_scalarizer_199431;

    -- out_scalarizer_199641(GPOUT,70)
    out_scalarizer_199641 <= ethash_search_B2_branch_out_scalarizer_199641;

    -- out_scalarizer_199851(GPOUT,71)
    out_scalarizer_199851 <= ethash_search_B2_branch_out_scalarizer_199851;

    -- out_stall_out_0(GPOUT,72)
    out_stall_out_0 <= ethash_search_B2_merge_out_stall_out_0;

    -- out_state_0_0_cast(GPOUT,73)
    out_state_0_0_cast <= ethash_search_B2_branch_out_state_0_0_cast;

    -- out_state_4_0_cast(GPOUT,74)
    out_state_4_0_cast <= ethash_search_B2_branch_out_state_4_0_cast;

    -- out_state_5_0_cast(GPOUT,75)
    out_state_5_0_cast <= ethash_search_B2_branch_out_state_5_0_cast;

    -- out_state_6_0_cast(GPOUT,76)
    out_state_6_0_cast <= ethash_search_B2_branch_out_state_6_0_cast;

    -- out_state_7_0_cast(GPOUT,77)
    out_state_7_0_cast <= ethash_search_B2_branch_out_state_7_0_cast;

    -- out_valid_out_0(GPOUT,78)
    out_valid_out_0 <= ethash_search_B2_branch_out_valid_out_0;

END normal;
