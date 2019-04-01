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

-- VHDL created from bb_ethash_search_B2_stall_region
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

entity bb_ethash_search_B2_stall_region is
    port (
        in_c0_exe1107 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2111 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3115 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4119 : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0196 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_07 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100166 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100376 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100586 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100796 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_014 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_098716 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_098918 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099120 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099326 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099536 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099746 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099956 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100061 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100271 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100481 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100691 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008101 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_115 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_198817 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199019 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199221 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199431 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199641 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199851 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_state_0_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B2_stall_region;

architecture normal of bb_ethash_search_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal i_state_0_0_cast_ethash_search_ethash_search215_state_0_0_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_state_4_0_cast_ethash_search_ethash_search216_state_4_0_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_state_5_0_cast_ethash_search_ethash_search217_state_5_0_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_state_6_0_cast_ethash_search_ethash_search218_state_6_0_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_state_7_0_cast_ethash_search_ethash_search219_state_7_0_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (1056 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
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
    signal bubble_select_stall_entry_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ee : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ff : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,23)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= in_stall_in or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- i_state_7_0_cast_ethash_search_ethash_search219_state_7_0_1_join_x(BITJOIN,8)@0
    i_state_7_0_cast_ethash_search_ethash_search219_state_7_0_1_join_x_q <= bubble_select_stall_entry_dd & bubble_select_stall_entry_q;

    -- i_state_6_0_cast_ethash_search_ethash_search218_state_6_0_1_join_x(BITJOIN,7)@0
    i_state_6_0_cast_ethash_search_ethash_search218_state_6_0_1_join_x_q <= bubble_select_stall_entry_ee & bubble_select_stall_entry_r;

    -- i_state_5_0_cast_ethash_search_ethash_search217_state_5_0_1_join_x(BITJOIN,6)@0
    i_state_5_0_cast_ethash_search_ethash_search217_state_5_0_1_join_x_q <= bubble_select_stall_entry_ff & bubble_select_stall_entry_s;

    -- i_state_4_0_cast_ethash_search_ethash_search216_state_4_0_1_join_x(BITJOIN,5)@0
    i_state_4_0_cast_ethash_search_ethash_search216_state_4_0_1_join_x_q <= bubble_select_stall_entry_u & bubble_select_stall_entry_t;

    -- i_state_0_0_cast_ethash_search_ethash_search215_state_0_0_1_join_x(BITJOIN,4)@0
    i_state_0_0_cast_ethash_search_ethash_search215_state_0_0_1_join_x_q <= bubble_select_stall_entry_y & bubble_select_stall_entry_l;

    -- bubble_join_stall_entry(BITJOIN,16)
    bubble_join_stall_entry_q <= in_scalarizer_199851 & in_scalarizer_199641 & in_scalarizer_199431 & in_scalarizer_199221 & in_scalarizer_199019 & in_scalarizer_198817 & in_scalarizer_115 & in_scalarizer_11008101 & in_scalarizer_1100691 & in_scalarizer_1100481 & in_scalarizer_1100271 & in_scalarizer_1100061 & in_scalarizer_099956 & in_scalarizer_099746 & in_scalarizer_099536 & in_scalarizer_099326 & in_scalarizer_099120 & in_scalarizer_098918 & in_scalarizer_098716 & in_scalarizer_014 & in_scalarizer_0100796 & in_scalarizer_0100586 & in_scalarizer_0100376 & in_scalarizer_0100166 & in_l_grpid_0_addr12 & in_l_grpid_07 & in_global_id_0196 & in_c0_exe4119 & in_c0_exe3115 & in_c0_exe2111 & in_c0_exe1107;

    -- bubble_select_stall_entry(BITSELECT,17)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(64 downto 1));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(128 downto 65));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(192 downto 129));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(224 downto 193));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(256 downto 225));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(288 downto 257));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(320 downto 289));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(352 downto 321));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(384 downto 353));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(416 downto 385));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(448 downto 417));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(480 downto 449));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(512 downto 481));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(544 downto 513));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(576 downto 545));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(608 downto 577));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(640 downto 609));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(672 downto 641));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(704 downto 673));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(736 downto 705));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(768 downto 737));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(800 downto 769));
    bubble_select_stall_entry_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(832 downto 801));
    bubble_select_stall_entry_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(864 downto 833));
    bubble_select_stall_entry_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(896 downto 865));
    bubble_select_stall_entry_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(928 downto 897));
    bubble_select_stall_entry_cc <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(960 downto 929));
    bubble_select_stall_entry_dd <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(992 downto 961));
    bubble_select_stall_entry_ee <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1024 downto 993));
    bubble_select_stall_entry_ff <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1056 downto 1025));

    -- dupName_0_sync_out_x(GPOUT,3)@0
    out_c0_exe1107 <= bubble_select_stall_entry_b;
    out_c0_exe2111 <= bubble_select_stall_entry_c;
    out_c0_exe3115 <= bubble_select_stall_entry_d;
    out_c0_exe4119 <= bubble_select_stall_entry_e;
    out_global_id_0196 <= bubble_select_stall_entry_f;
    out_l_grpid_07 <= bubble_select_stall_entry_g;
    out_l_grpid_0_addr12 <= bubble_select_stall_entry_h;
    out_scalarizer_0100166 <= bubble_select_stall_entry_i;
    out_scalarizer_0100376 <= bubble_select_stall_entry_j;
    out_scalarizer_0100586 <= bubble_select_stall_entry_k;
    out_scalarizer_0100796 <= bubble_select_stall_entry_l;
    out_scalarizer_014 <= bubble_select_stall_entry_m;
    out_scalarizer_098716 <= bubble_select_stall_entry_n;
    out_scalarizer_098918 <= bubble_select_stall_entry_o;
    out_scalarizer_099120 <= bubble_select_stall_entry_p;
    out_scalarizer_099326 <= bubble_select_stall_entry_q;
    out_scalarizer_099536 <= bubble_select_stall_entry_r;
    out_scalarizer_099746 <= bubble_select_stall_entry_s;
    out_scalarizer_099956 <= bubble_select_stall_entry_t;
    out_scalarizer_1100061 <= bubble_select_stall_entry_u;
    out_scalarizer_1100271 <= bubble_select_stall_entry_v;
    out_scalarizer_1100481 <= bubble_select_stall_entry_w;
    out_scalarizer_1100691 <= bubble_select_stall_entry_x;
    out_scalarizer_11008101 <= bubble_select_stall_entry_y;
    out_scalarizer_115 <= bubble_select_stall_entry_z;
    out_scalarizer_198817 <= bubble_select_stall_entry_aa;
    out_scalarizer_199019 <= bubble_select_stall_entry_bb;
    out_scalarizer_199221 <= bubble_select_stall_entry_cc;
    out_scalarizer_199431 <= bubble_select_stall_entry_dd;
    out_scalarizer_199641 <= bubble_select_stall_entry_ee;
    out_scalarizer_199851 <= bubble_select_stall_entry_ff;
    out_state_0_0_cast <= i_state_0_0_cast_ethash_search_ethash_search215_state_0_0_1_join_x_q;
    out_state_4_0_cast <= i_state_4_0_cast_ethash_search_ethash_search216_state_4_0_1_join_x_q;
    out_state_5_0_cast <= i_state_5_0_cast_ethash_search_ethash_search217_state_5_0_1_join_x_q;
    out_state_6_0_cast <= i_state_6_0_cast_ethash_search_ethash_search218_state_6_0_1_join_x_q;
    out_state_7_0_cast <= i_state_7_0_cast_ethash_search_ethash_search219_state_7_0_1_join_x_q;
    out_valid_out <= SE_stall_entry_V0;

    -- sync_out(GPOUT,14)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
