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

-- VHDL created from ethash_search_B2_merge
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

entity ethash_search_B2_merge is
    port (
        in_c0_exe1107_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2111_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3115_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4119_0 : in std_logic_vector(63 downto 0);  -- ufix64
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B2_merge;

architecture normal of ethash_search_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe1107(GPOUT,35)
    out_c0_exe1107 <= in_c0_exe1107_0;

    -- out_c0_exe2111(GPOUT,36)
    out_c0_exe2111 <= in_c0_exe2111_0;

    -- out_c0_exe3115(GPOUT,37)
    out_c0_exe3115 <= in_c0_exe3115_0;

    -- out_c0_exe4119(GPOUT,38)
    out_c0_exe4119 <= in_c0_exe4119_0;

    -- out_global_id_0196(GPOUT,39)
    out_global_id_0196 <= in_global_id_0196_0;

    -- out_l_grpid_07(GPOUT,40)
    out_l_grpid_07 <= in_l_grpid_07_0;

    -- out_l_grpid_0_addr12(GPOUT,41)
    out_l_grpid_0_addr12 <= in_l_grpid_0_addr12_0;

    -- out_scalarizer_0100166(GPOUT,42)
    out_scalarizer_0100166 <= in_scalarizer_0100166_0;

    -- out_scalarizer_0100376(GPOUT,43)
    out_scalarizer_0100376 <= in_scalarizer_0100376_0;

    -- out_scalarizer_0100586(GPOUT,44)
    out_scalarizer_0100586 <= in_scalarizer_0100586_0;

    -- out_scalarizer_0100796(GPOUT,45)
    out_scalarizer_0100796 <= in_scalarizer_0100796_0;

    -- out_scalarizer_014(GPOUT,46)
    out_scalarizer_014 <= in_scalarizer_014_0;

    -- out_scalarizer_098716(GPOUT,47)
    out_scalarizer_098716 <= in_scalarizer_098716_0;

    -- out_scalarizer_098918(GPOUT,48)
    out_scalarizer_098918 <= in_scalarizer_098918_0;

    -- out_scalarizer_099120(GPOUT,49)
    out_scalarizer_099120 <= in_scalarizer_099120_0;

    -- out_scalarizer_099326(GPOUT,50)
    out_scalarizer_099326 <= in_scalarizer_099326_0;

    -- out_scalarizer_099536(GPOUT,51)
    out_scalarizer_099536 <= in_scalarizer_099536_0;

    -- out_scalarizer_099746(GPOUT,52)
    out_scalarizer_099746 <= in_scalarizer_099746_0;

    -- out_scalarizer_099956(GPOUT,53)
    out_scalarizer_099956 <= in_scalarizer_099956_0;

    -- out_scalarizer_1100061(GPOUT,54)
    out_scalarizer_1100061 <= in_scalarizer_1100061_0;

    -- out_scalarizer_1100271(GPOUT,55)
    out_scalarizer_1100271 <= in_scalarizer_1100271_0;

    -- out_scalarizer_1100481(GPOUT,56)
    out_scalarizer_1100481 <= in_scalarizer_1100481_0;

    -- out_scalarizer_1100691(GPOUT,57)
    out_scalarizer_1100691 <= in_scalarizer_1100691_0;

    -- out_scalarizer_11008101(GPOUT,58)
    out_scalarizer_11008101 <= in_scalarizer_11008101_0;

    -- out_scalarizer_115(GPOUT,59)
    out_scalarizer_115 <= in_scalarizer_115_0;

    -- out_scalarizer_198817(GPOUT,60)
    out_scalarizer_198817 <= in_scalarizer_198817_0;

    -- out_scalarizer_199019(GPOUT,61)
    out_scalarizer_199019 <= in_scalarizer_199019_0;

    -- out_scalarizer_199221(GPOUT,62)
    out_scalarizer_199221 <= in_scalarizer_199221_0;

    -- out_scalarizer_199431(GPOUT,63)
    out_scalarizer_199431 <= in_scalarizer_199431_0;

    -- out_scalarizer_199641(GPOUT,64)
    out_scalarizer_199641 <= in_scalarizer_199641_0;

    -- out_scalarizer_199851(GPOUT,65)
    out_scalarizer_199851 <= in_scalarizer_199851_0;

    -- stall_out(LOGICAL,68)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,66)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,67)
    out_valid_out <= in_valid_in_0;

END normal;
