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

-- VHDL created from bb_ethash_search_B6_stall_region
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

entity bb_ethash_search_B6_stall_region is
    port (
        in_acl_1413178 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1414179 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1415176 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1416177 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1103 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1172 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe2173 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe3174 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe4175 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0192 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_03 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100162 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100372 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100582 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100792 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099322 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099532 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099742 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099952 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100057 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100267 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100477 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100687 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100897 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199427 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199637 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199847 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1103 : out std_logic_vector(0 downto 0);  -- ufix1
        out_global_id_0192 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_03 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100162 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100372 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100582 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100792 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099322 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099532 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099742 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099952 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100057 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100267 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100477 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100687 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100897 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199427 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199637 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199847 : out std_logic_vector(31 downto 0);  -- ufix32
        out_state_10_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_11_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_8_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_9_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B6_stall_region;

architecture normal of bb_ethash_search_B6_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal i_state_10_2_cast_ethash_search_ethash_search365_state_10_2_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_state_11_2_cast_ethash_search_ethash_search366_state_11_2_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_state_8_2_cast_ethash_search_ethash_search363_state_8_2_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_state_9_2_cast_ethash_search_ethash_search364_state_9_2_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (832 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,21)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= in_stall_in or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- i_state_9_2_cast_ethash_search_ethash_search364_state_9_2_1_join_x(BITJOIN,7)@0
    i_state_9_2_cast_ethash_search_ethash_search364_state_9_2_1_join_x_q <= bubble_select_stall_entry_c & bubble_select_stall_entry_b;

    -- i_state_8_2_cast_ethash_search_ethash_search363_state_8_2_1_join_x(BITJOIN,6)@0
    i_state_8_2_cast_ethash_search_ethash_search363_state_8_2_1_join_x_q <= bubble_select_stall_entry_e & bubble_select_stall_entry_d;

    -- i_state_11_2_cast_ethash_search_ethash_search366_state_11_2_1_join_x(BITJOIN,5)@0
    i_state_11_2_cast_ethash_search_ethash_search366_state_11_2_1_join_x_q <= bubble_select_stall_entry_h & bubble_select_stall_entry_g;

    -- i_state_10_2_cast_ethash_search_ethash_search365_state_10_2_1_join_x(BITJOIN,4)@0
    i_state_10_2_cast_ethash_search_ethash_search365_state_10_2_1_join_x_q <= bubble_select_stall_entry_j & bubble_select_stall_entry_i;

    -- bubble_join_stall_entry(BITJOIN,15)
    bubble_join_stall_entry_q <= in_scalarizer_199847 & in_scalarizer_199637 & in_scalarizer_199427 & in_scalarizer_1100897 & in_scalarizer_1100687 & in_scalarizer_1100477 & in_scalarizer_1100267 & in_scalarizer_1100057 & in_scalarizer_099952 & in_scalarizer_099742 & in_scalarizer_099532 & in_scalarizer_099322 & in_scalarizer_0100792 & in_scalarizer_0100582 & in_scalarizer_0100372 & in_scalarizer_0100162 & in_l_grpid_03 & in_global_id_0192 & in_c1_exe4175 & in_c1_exe3174 & in_c1_exe2173 & in_c1_exe1172 & in_c0_exe1103 & in_acl_1416177 & in_acl_1415176 & in_acl_1414179 & in_acl_1413178;

    -- bubble_select_stall_entry(BITSELECT,16)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(128 downto 128));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(160 downto 129));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(192 downto 161));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(224 downto 193));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(256 downto 225));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(288 downto 257));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(320 downto 289));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(352 downto 321));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(384 downto 353));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(416 downto 385));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(448 downto 417));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(480 downto 449));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(512 downto 481));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(544 downto 513));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(576 downto 545));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(608 downto 577));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(640 downto 609));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(672 downto 641));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(704 downto 673));
    bubble_select_stall_entry_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(736 downto 705));
    bubble_select_stall_entry_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(768 downto 737));
    bubble_select_stall_entry_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(800 downto 769));
    bubble_select_stall_entry_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(832 downto 801));

    -- dupName_0_sync_out_x(GPOUT,3)@0
    out_c0_exe1103 <= bubble_select_stall_entry_f;
    out_global_id_0192 <= bubble_select_stall_entry_k;
    out_l_grpid_03 <= bubble_select_stall_entry_l;
    out_scalarizer_0100162 <= bubble_select_stall_entry_m;
    out_scalarizer_0100372 <= bubble_select_stall_entry_n;
    out_scalarizer_0100582 <= bubble_select_stall_entry_o;
    out_scalarizer_0100792 <= bubble_select_stall_entry_p;
    out_scalarizer_099322 <= bubble_select_stall_entry_q;
    out_scalarizer_099532 <= bubble_select_stall_entry_r;
    out_scalarizer_099742 <= bubble_select_stall_entry_s;
    out_scalarizer_099952 <= bubble_select_stall_entry_t;
    out_scalarizer_1100057 <= bubble_select_stall_entry_u;
    out_scalarizer_1100267 <= bubble_select_stall_entry_v;
    out_scalarizer_1100477 <= bubble_select_stall_entry_w;
    out_scalarizer_1100687 <= bubble_select_stall_entry_x;
    out_scalarizer_1100897 <= bubble_select_stall_entry_y;
    out_scalarizer_199427 <= bubble_select_stall_entry_z;
    out_scalarizer_199637 <= bubble_select_stall_entry_aa;
    out_scalarizer_199847 <= bubble_select_stall_entry_bb;
    out_state_10_2_cast <= i_state_10_2_cast_ethash_search_ethash_search365_state_10_2_1_join_x_q;
    out_state_11_2_cast <= i_state_11_2_cast_ethash_search_ethash_search366_state_11_2_1_join_x_q;
    out_state_8_2_cast <= i_state_8_2_cast_ethash_search_ethash_search363_state_8_2_1_join_x_q;
    out_state_9_2_cast <= i_state_9_2_cast_ethash_search_ethash_search364_state_9_2_1_join_x_q;
    out_valid_out <= SE_stall_entry_V0;

    -- sync_out(GPOUT,13)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
