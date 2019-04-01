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

-- VHDL created from bb_ethash_calculate_dag_item_B1
-- VHDL created on Mon Apr  1 13:52:57 2019


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

entity bb_ethash_calculate_dag_item_B1 is
    port (
        out_c0_exit11_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_3 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit11_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_5 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit11_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe112 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe116 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe213 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exe50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_dag_node_pm_0 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_acl_hw_wg_id43_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id43_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe116_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe116_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_dag_node_pm_0_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_dag_node_pm_0_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_light : in std_logic_vector(63 downto 0);  -- ufix64
        in_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i_i_ph_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i_i_ph_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01389_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01389_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01391_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01391_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01393_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01393_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01395_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01395_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01397_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01397_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01399_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01399_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01401_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01401_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01403_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01403_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01405_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01405_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01407_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01407_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01409_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01409_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01411_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01411_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01413_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01413_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01415_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01415_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01417_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01417_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01419_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01419_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01421_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01421_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01423_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01423_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01425_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01425_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01427_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01427_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01429_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01429_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11390_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11390_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11392_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11392_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11394_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11394_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11396_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11396_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11398_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11398_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11400_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11400_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11402_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11402_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11404_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11404_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11406_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11406_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11408_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11408_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11410_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11410_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11412_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11412_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11414_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11414_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11416_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11416_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11418_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11418_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11420_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11420_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11422_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11422_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11424_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11424_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11426_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11426_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11428_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11428_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11430_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11430_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B1;

architecture normal of bb_ethash_calculate_dag_item_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_calculate_dag_item_B1_branch is
        port (
            in_c0_exit11_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit11_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit11_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit11_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit11_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit11_5 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit11_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit11_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe112 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe116 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe213 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe5 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exe50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dag_node_pm_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_3 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit11_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_5 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit11_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe112 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe116 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe213 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exe50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_dag_node_pm_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B1_stall_region is
        port (
            in_acl_hw_wg_id43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe116 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dag_node_pm_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_i_ph : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01389 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01391 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01393 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01395 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01397 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01399 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01401 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01403 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01405 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01407 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01409 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01411 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01413 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01415 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01417 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01419 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01421 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01423 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01425 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01427 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01429 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11390 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11392 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11394 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11396 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11398 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11400 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11402 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11404 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11406 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11408 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11410 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11412 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11414 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11416 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11418 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11420 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11422 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11424 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11426 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11428 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11430 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_3 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit11_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_5 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit11_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe112 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe116 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe213 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exe50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_dag_node_pm_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B1_merge is
        port (
            in_acl_hw_wg_id43_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id43_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe116_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe116_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dag_node_pm_0_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_dag_node_pm_0_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_r_0_i_i_ph_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_i_ph_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01389_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01389_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01391_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01391_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01393_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01393_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01395_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01395_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01397_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01397_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01399_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01399_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01401_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01401_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01403_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01403_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01405_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01405_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01407_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01407_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01409_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01409_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01411_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01411_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01413_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01413_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01415_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01415_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01417_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01417_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01419_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01419_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01421_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01421_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01423_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01423_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01425_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01425_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01427_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01427_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01429_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01429_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11390_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11390_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11392_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11392_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11394_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11394_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11396_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11396_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11398_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11398_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11400_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11400_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11402_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11402_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11404_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11404_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11406_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11406_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11408_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11408_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11410_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11410_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11412_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11412_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11414_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11414_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11416_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11416_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11418_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11418_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11420_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11420_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11422_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11422_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11424_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11424_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11426_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11426_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11428_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11428_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11430_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11430_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe116 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_dag_node_pm_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_r_0_i_i_ph : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01389 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01391 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01393 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01395 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01397 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01399 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01401 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01403 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01405 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01407 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01409 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01411 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01415 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01417 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01419 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01421 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01423 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01425 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01427 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01429 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11390 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11392 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11394 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11396 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11398 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11400 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11402 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11404 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11406 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11408 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11410 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11412 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11414 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11416 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11418 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11420 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11422 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11424 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11426 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11428 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11430 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_acl_hw_wg_id43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe112 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe116 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe213 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe25 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe26 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe27 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe28 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe29 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe30 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe31 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe32 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe33 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe34 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe35 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe36 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe37 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe44 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe45 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe46 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe47 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe48 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe49 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe50 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_dag_node_pm_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_acl_hw_wg_id43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe112 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe116 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe213 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_dag_node_pm_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_acl_hw_wg_id43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_c0_exe116 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_dag_node_pm_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_r_0_i_i_ph : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01389 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01391 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01393 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01395 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01397 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01399 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01401 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01403 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01405 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01407 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01409 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01411 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01413 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01415 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01417 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01419 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01421 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01423 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01425 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01427 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_01429 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11390 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11392 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11394 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11396 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11398 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11400 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11402 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11404 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11406 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11408 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11410 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11412 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11414 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11416 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11418 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11420 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11422 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11424 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11426 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11428 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_scalarizer_11430 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_calculate_dag_item_B1_merge(BLACKBOX,110)
    theethash_calculate_dag_item_B1_merge : ethash_calculate_dag_item_B1_merge
    PORT MAP (
        in_acl_hw_wg_id43_0 => in_acl_hw_wg_id43_0,
        in_acl_hw_wg_id43_1 => in_acl_hw_wg_id43_1,
        in_c0_exe116_0 => in_c0_exe116_0,
        in_c0_exe116_1 => in_c0_exe116_1,
        in_dag_node_pm_0_0 => in_dag_node_pm_0_0,
        in_dag_node_pm_0_1 => in_dag_node_pm_0_1,
        in_r_0_i_i_ph_0 => in_r_0_i_i_ph_0,
        in_r_0_i_i_ph_1 => in_r_0_i_i_ph_1,
        in_scalarizer_01389_0 => in_scalarizer_01389_0,
        in_scalarizer_01389_1 => in_scalarizer_01389_1,
        in_scalarizer_01391_0 => in_scalarizer_01391_0,
        in_scalarizer_01391_1 => in_scalarizer_01391_1,
        in_scalarizer_01393_0 => in_scalarizer_01393_0,
        in_scalarizer_01393_1 => in_scalarizer_01393_1,
        in_scalarizer_01395_0 => in_scalarizer_01395_0,
        in_scalarizer_01395_1 => in_scalarizer_01395_1,
        in_scalarizer_01397_0 => in_scalarizer_01397_0,
        in_scalarizer_01397_1 => in_scalarizer_01397_1,
        in_scalarizer_01399_0 => in_scalarizer_01399_0,
        in_scalarizer_01399_1 => in_scalarizer_01399_1,
        in_scalarizer_01401_0 => in_scalarizer_01401_0,
        in_scalarizer_01401_1 => in_scalarizer_01401_1,
        in_scalarizer_01403_0 => in_scalarizer_01403_0,
        in_scalarizer_01403_1 => in_scalarizer_01403_1,
        in_scalarizer_01405_0 => in_scalarizer_01405_0,
        in_scalarizer_01405_1 => in_scalarizer_01405_1,
        in_scalarizer_01407_0 => in_scalarizer_01407_0,
        in_scalarizer_01407_1 => in_scalarizer_01407_1,
        in_scalarizer_01409_0 => in_scalarizer_01409_0,
        in_scalarizer_01409_1 => in_scalarizer_01409_1,
        in_scalarizer_01411_0 => in_scalarizer_01411_0,
        in_scalarizer_01411_1 => in_scalarizer_01411_1,
        in_scalarizer_01413_0 => in_scalarizer_01413_0,
        in_scalarizer_01413_1 => in_scalarizer_01413_1,
        in_scalarizer_01415_0 => in_scalarizer_01415_0,
        in_scalarizer_01415_1 => in_scalarizer_01415_1,
        in_scalarizer_01417_0 => in_scalarizer_01417_0,
        in_scalarizer_01417_1 => in_scalarizer_01417_1,
        in_scalarizer_01419_0 => in_scalarizer_01419_0,
        in_scalarizer_01419_1 => in_scalarizer_01419_1,
        in_scalarizer_01421_0 => in_scalarizer_01421_0,
        in_scalarizer_01421_1 => in_scalarizer_01421_1,
        in_scalarizer_01423_0 => in_scalarizer_01423_0,
        in_scalarizer_01423_1 => in_scalarizer_01423_1,
        in_scalarizer_01425_0 => in_scalarizer_01425_0,
        in_scalarizer_01425_1 => in_scalarizer_01425_1,
        in_scalarizer_01427_0 => in_scalarizer_01427_0,
        in_scalarizer_01427_1 => in_scalarizer_01427_1,
        in_scalarizer_01429_0 => in_scalarizer_01429_0,
        in_scalarizer_01429_1 => in_scalarizer_01429_1,
        in_scalarizer_0_0 => in_scalarizer_0_0,
        in_scalarizer_0_1 => in_scalarizer_0_1,
        in_scalarizer_11390_0 => in_scalarizer_11390_0,
        in_scalarizer_11390_1 => in_scalarizer_11390_1,
        in_scalarizer_11392_0 => in_scalarizer_11392_0,
        in_scalarizer_11392_1 => in_scalarizer_11392_1,
        in_scalarizer_11394_0 => in_scalarizer_11394_0,
        in_scalarizer_11394_1 => in_scalarizer_11394_1,
        in_scalarizer_11396_0 => in_scalarizer_11396_0,
        in_scalarizer_11396_1 => in_scalarizer_11396_1,
        in_scalarizer_11398_0 => in_scalarizer_11398_0,
        in_scalarizer_11398_1 => in_scalarizer_11398_1,
        in_scalarizer_11400_0 => in_scalarizer_11400_0,
        in_scalarizer_11400_1 => in_scalarizer_11400_1,
        in_scalarizer_11402_0 => in_scalarizer_11402_0,
        in_scalarizer_11402_1 => in_scalarizer_11402_1,
        in_scalarizer_11404_0 => in_scalarizer_11404_0,
        in_scalarizer_11404_1 => in_scalarizer_11404_1,
        in_scalarizer_11406_0 => in_scalarizer_11406_0,
        in_scalarizer_11406_1 => in_scalarizer_11406_1,
        in_scalarizer_11408_0 => in_scalarizer_11408_0,
        in_scalarizer_11408_1 => in_scalarizer_11408_1,
        in_scalarizer_11410_0 => in_scalarizer_11410_0,
        in_scalarizer_11410_1 => in_scalarizer_11410_1,
        in_scalarizer_11412_0 => in_scalarizer_11412_0,
        in_scalarizer_11412_1 => in_scalarizer_11412_1,
        in_scalarizer_11414_0 => in_scalarizer_11414_0,
        in_scalarizer_11414_1 => in_scalarizer_11414_1,
        in_scalarizer_11416_0 => in_scalarizer_11416_0,
        in_scalarizer_11416_1 => in_scalarizer_11416_1,
        in_scalarizer_11418_0 => in_scalarizer_11418_0,
        in_scalarizer_11418_1 => in_scalarizer_11418_1,
        in_scalarizer_11420_0 => in_scalarizer_11420_0,
        in_scalarizer_11420_1 => in_scalarizer_11420_1,
        in_scalarizer_11422_0 => in_scalarizer_11422_0,
        in_scalarizer_11422_1 => in_scalarizer_11422_1,
        in_scalarizer_11424_0 => in_scalarizer_11424_0,
        in_scalarizer_11424_1 => in_scalarizer_11424_1,
        in_scalarizer_11426_0 => in_scalarizer_11426_0,
        in_scalarizer_11426_1 => in_scalarizer_11426_1,
        in_scalarizer_11428_0 => in_scalarizer_11428_0,
        in_scalarizer_11428_1 => in_scalarizer_11428_1,
        in_scalarizer_11430_0 => in_scalarizer_11430_0,
        in_scalarizer_11430_1 => in_scalarizer_11430_1,
        in_scalarizer_1_0 => in_scalarizer_1_0,
        in_scalarizer_1_1 => in_scalarizer_1_1,
        in_stall_in => bb_ethash_calculate_dag_item_B1_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_acl_hw_wg_id43 => ethash_calculate_dag_item_B1_merge_out_acl_hw_wg_id43,
        out_c0_exe116 => ethash_calculate_dag_item_B1_merge_out_c0_exe116,
        out_dag_node_pm_0 => ethash_calculate_dag_item_B1_merge_out_dag_node_pm_0,
        out_r_0_i_i_ph => ethash_calculate_dag_item_B1_merge_out_r_0_i_i_ph,
        out_scalarizer_0 => ethash_calculate_dag_item_B1_merge_out_scalarizer_0,
        out_scalarizer_01389 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01389,
        out_scalarizer_01391 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01391,
        out_scalarizer_01393 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01393,
        out_scalarizer_01395 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01395,
        out_scalarizer_01397 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01397,
        out_scalarizer_01399 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01399,
        out_scalarizer_01401 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01401,
        out_scalarizer_01403 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01403,
        out_scalarizer_01405 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01405,
        out_scalarizer_01407 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01407,
        out_scalarizer_01409 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01409,
        out_scalarizer_01411 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01411,
        out_scalarizer_01413 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01413,
        out_scalarizer_01415 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01415,
        out_scalarizer_01417 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01417,
        out_scalarizer_01419 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01419,
        out_scalarizer_01421 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01421,
        out_scalarizer_01423 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01423,
        out_scalarizer_01425 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01425,
        out_scalarizer_01427 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01427,
        out_scalarizer_01429 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01429,
        out_scalarizer_1 => ethash_calculate_dag_item_B1_merge_out_scalarizer_1,
        out_scalarizer_11390 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11390,
        out_scalarizer_11392 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11392,
        out_scalarizer_11394 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11394,
        out_scalarizer_11396 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11396,
        out_scalarizer_11398 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11398,
        out_scalarizer_11400 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11400,
        out_scalarizer_11402 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11402,
        out_scalarizer_11404 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11404,
        out_scalarizer_11406 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11406,
        out_scalarizer_11408 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11408,
        out_scalarizer_11410 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11410,
        out_scalarizer_11412 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11412,
        out_scalarizer_11414 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11414,
        out_scalarizer_11416 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11416,
        out_scalarizer_11418 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11418,
        out_scalarizer_11420 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11420,
        out_scalarizer_11422 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11422,
        out_scalarizer_11424 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11424,
        out_scalarizer_11426 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11426,
        out_scalarizer_11428 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11428,
        out_scalarizer_11430 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11430,
        out_stall_out_0 => ethash_calculate_dag_item_B1_merge_out_stall_out_0,
        out_stall_out_1 => ethash_calculate_dag_item_B1_merge_out_stall_out_1,
        out_valid_out => ethash_calculate_dag_item_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B1_stall_region(BLACKBOX,109)
    thebb_ethash_calculate_dag_item_B1_stall_region : bb_ethash_calculate_dag_item_B1_stall_region
    PORT MAP (
        in_acl_hw_wg_id43 => ethash_calculate_dag_item_B1_merge_out_acl_hw_wg_id43,
        in_c0_exe116 => ethash_calculate_dag_item_B1_merge_out_c0_exe116,
        in_dag_node_pm_0 => ethash_calculate_dag_item_B1_merge_out_dag_node_pm_0,
        in_isolate => in_isolate,
        in_r_0_i_i_ph => ethash_calculate_dag_item_B1_merge_out_r_0_i_i_ph,
        in_scalarizer_0 => ethash_calculate_dag_item_B1_merge_out_scalarizer_0,
        in_scalarizer_01389 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01389,
        in_scalarizer_01391 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01391,
        in_scalarizer_01393 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01393,
        in_scalarizer_01395 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01395,
        in_scalarizer_01397 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01397,
        in_scalarizer_01399 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01399,
        in_scalarizer_01401 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01401,
        in_scalarizer_01403 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01403,
        in_scalarizer_01405 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01405,
        in_scalarizer_01407 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01407,
        in_scalarizer_01409 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01409,
        in_scalarizer_01411 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01411,
        in_scalarizer_01413 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01413,
        in_scalarizer_01415 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01415,
        in_scalarizer_01417 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01417,
        in_scalarizer_01419 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01419,
        in_scalarizer_01421 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01421,
        in_scalarizer_01423 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01423,
        in_scalarizer_01425 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01425,
        in_scalarizer_01427 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01427,
        in_scalarizer_01429 => ethash_calculate_dag_item_B1_merge_out_scalarizer_01429,
        in_scalarizer_1 => ethash_calculate_dag_item_B1_merge_out_scalarizer_1,
        in_scalarizer_11390 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11390,
        in_scalarizer_11392 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11392,
        in_scalarizer_11394 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11394,
        in_scalarizer_11396 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11396,
        in_scalarizer_11398 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11398,
        in_scalarizer_11400 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11400,
        in_scalarizer_11402 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11402,
        in_scalarizer_11404 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11404,
        in_scalarizer_11406 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11406,
        in_scalarizer_11408 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11408,
        in_scalarizer_11410 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11410,
        in_scalarizer_11412 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11412,
        in_scalarizer_11414 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11414,
        in_scalarizer_11416 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11416,
        in_scalarizer_11418 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11418,
        in_scalarizer_11420 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11420,
        in_scalarizer_11422 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11422,
        in_scalarizer_11424 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11424,
        in_scalarizer_11426 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11426,
        in_scalarizer_11428 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11428,
        in_scalarizer_11430 => ethash_calculate_dag_item_B1_merge_out_scalarizer_11430,
        in_stall_in => ethash_calculate_dag_item_B1_branch_aunroll_x_out_stall_out,
        in_valid_in => ethash_calculate_dag_item_B1_merge_out_valid_out,
        out_c0_exit11_0 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_0,
        out_c0_exit11_1 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_1,
        out_c0_exit11_2 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_2,
        out_c0_exit11_3 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_3,
        out_c0_exit11_4 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_4,
        out_c0_exit11_5 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_5,
        out_c0_exit11_6 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_6,
        out_c0_exit11_7 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_7,
        out_c0_exit11_8 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_8,
        out_c0_exit11_9 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_9,
        out_c0_exit11_10 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_10,
        out_c0_exit11_11 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_11,
        out_c0_exit11_12 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_12,
        out_c0_exit11_13 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_13,
        out_c0_exit11_14 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_14,
        out_c0_exit11_15 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_15,
        out_c0_exit11_16 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_16,
        out_c0_exit11_17 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_17,
        out_c0_exit11_18 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_18,
        out_c0_exit11_19 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_19,
        out_c0_exit11_20 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_20,
        out_c0_exit11_21 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_21,
        out_c0_exit11_22 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_22,
        out_c0_exit11_23 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_23,
        out_c0_exit11_24 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_24,
        out_c0_exit11_25 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_25,
        out_c0_exit11_26 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_26,
        out_c0_exit11_27 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_27,
        out_c0_exit11_28 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_28,
        out_c0_exit11_29 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_29,
        out_c0_exit11_30 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_30,
        out_c0_exit11_31 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_31,
        out_c0_exit11_32 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_32,
        out_c0_exit11_33 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_33,
        out_c0_exit11_34 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_34,
        out_c0_exit11_35 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_35,
        out_c0_exit11_36 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_36,
        out_c0_exit11_37 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_37,
        out_c0_exit11_38 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_38,
        out_c0_exit11_39 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_39,
        out_c0_exit11_40 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_40,
        out_c0_exit11_41 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_41,
        out_c0_exit11_42 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_42,
        out_c0_exit11_43 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_43,
        out_c0_exit11_44 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_44,
        out_c0_exit11_45 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_45,
        out_c0_exit11_46 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_46,
        out_c0_exit11_47 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_47,
        out_c0_exit11_48 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_48,
        out_c0_exit11_49 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_49,
        out_c0_exit11_50 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_50,
        out_acl_hw_wg_id43 => bb_ethash_calculate_dag_item_B1_stall_region_out_acl_hw_wg_id43,
        out_c0_exe10 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe10,
        out_c0_exe11 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe11,
        out_c0_exe112 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe112,
        out_c0_exe116 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe116,
        out_c0_exe12 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe12,
        out_c0_exe13 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe13,
        out_c0_exe14 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe14,
        out_c0_exe15 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe15,
        out_c0_exe16 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe16,
        out_c0_exe17 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe17,
        out_c0_exe18 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe18,
        out_c0_exe19 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe19,
        out_c0_exe20 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe20,
        out_c0_exe21 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe21,
        out_c0_exe213 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe213,
        out_c0_exe22 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe22,
        out_c0_exe23 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe23,
        out_c0_exe24 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe24,
        out_c0_exe25 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe25,
        out_c0_exe26 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe26,
        out_c0_exe27 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe27,
        out_c0_exe28 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe28,
        out_c0_exe29 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe29,
        out_c0_exe30 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe30,
        out_c0_exe31 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe31,
        out_c0_exe32 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe32,
        out_c0_exe33 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe33,
        out_c0_exe34 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe34,
        out_c0_exe35 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe35,
        out_c0_exe36 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe36,
        out_c0_exe37 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe37,
        out_c0_exe38 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe38,
        out_c0_exe39 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe39,
        out_c0_exe4 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe4,
        out_c0_exe40 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe40,
        out_c0_exe41 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe41,
        out_c0_exe42 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe42,
        out_c0_exe43 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe43,
        out_c0_exe44 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe44,
        out_c0_exe45 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe45,
        out_c0_exe46 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe46,
        out_c0_exe47 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe47,
        out_c0_exe48 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe48,
        out_c0_exe49 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe49,
        out_c0_exe5 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe5,
        out_c0_exe50 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe50,
        out_c0_exe6 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe6,
        out_c0_exe7 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe7,
        out_c0_exe8 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe8,
        out_c0_exe9 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe9,
        out_dag_node_pm_0 => bb_ethash_calculate_dag_item_B1_stall_region_out_dag_node_pm_0,
        out_stall_out => bb_ethash_calculate_dag_item_B1_stall_region_out_stall_out,
        out_valid_out => bb_ethash_calculate_dag_item_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_calculate_dag_item_B1_branch_aunroll_x(BLACKBOX,2)
    theethash_calculate_dag_item_B1_branch_aunroll_x : ethash_calculate_dag_item_B1_branch
    PORT MAP (
        in_c0_exit11_0 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_0,
        in_c0_exit11_1 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_1,
        in_c0_exit11_2 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_2,
        in_c0_exit11_3 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_3,
        in_c0_exit11_4 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_4,
        in_c0_exit11_5 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_5,
        in_c0_exit11_6 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_6,
        in_c0_exit11_7 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_7,
        in_c0_exit11_8 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_8,
        in_c0_exit11_9 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_9,
        in_c0_exit11_10 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_10,
        in_c0_exit11_11 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_11,
        in_c0_exit11_12 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_12,
        in_c0_exit11_13 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_13,
        in_c0_exit11_14 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_14,
        in_c0_exit11_15 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_15,
        in_c0_exit11_16 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_16,
        in_c0_exit11_17 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_17,
        in_c0_exit11_18 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_18,
        in_c0_exit11_19 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_19,
        in_c0_exit11_20 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_20,
        in_c0_exit11_21 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_21,
        in_c0_exit11_22 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_22,
        in_c0_exit11_23 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_23,
        in_c0_exit11_24 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_24,
        in_c0_exit11_25 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_25,
        in_c0_exit11_26 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_26,
        in_c0_exit11_27 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_27,
        in_c0_exit11_28 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_28,
        in_c0_exit11_29 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_29,
        in_c0_exit11_30 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_30,
        in_c0_exit11_31 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_31,
        in_c0_exit11_32 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_32,
        in_c0_exit11_33 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_33,
        in_c0_exit11_34 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_34,
        in_c0_exit11_35 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_35,
        in_c0_exit11_36 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_36,
        in_c0_exit11_37 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_37,
        in_c0_exit11_38 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_38,
        in_c0_exit11_39 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_39,
        in_c0_exit11_40 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_40,
        in_c0_exit11_41 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_41,
        in_c0_exit11_42 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_42,
        in_c0_exit11_43 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_43,
        in_c0_exit11_44 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_44,
        in_c0_exit11_45 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_45,
        in_c0_exit11_46 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_46,
        in_c0_exit11_47 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_47,
        in_c0_exit11_48 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_48,
        in_c0_exit11_49 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_49,
        in_c0_exit11_50 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exit11_50,
        in_acl_hw_wg_id43 => bb_ethash_calculate_dag_item_B1_stall_region_out_acl_hw_wg_id43,
        in_c0_exe10 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe10,
        in_c0_exe11 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe11,
        in_c0_exe112 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe112,
        in_c0_exe116 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe116,
        in_c0_exe12 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe12,
        in_c0_exe13 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe13,
        in_c0_exe14 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe14,
        in_c0_exe15 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe15,
        in_c0_exe16 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe16,
        in_c0_exe17 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe17,
        in_c0_exe18 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe18,
        in_c0_exe19 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe19,
        in_c0_exe20 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe20,
        in_c0_exe21 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe21,
        in_c0_exe213 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe213,
        in_c0_exe22 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe22,
        in_c0_exe23 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe23,
        in_c0_exe24 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe24,
        in_c0_exe25 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe25,
        in_c0_exe26 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe26,
        in_c0_exe27 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe27,
        in_c0_exe28 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe28,
        in_c0_exe29 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe29,
        in_c0_exe30 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe30,
        in_c0_exe31 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe31,
        in_c0_exe32 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe32,
        in_c0_exe33 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe33,
        in_c0_exe34 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe34,
        in_c0_exe35 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe35,
        in_c0_exe36 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe36,
        in_c0_exe37 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe37,
        in_c0_exe38 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe38,
        in_c0_exe39 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe39,
        in_c0_exe4 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe4,
        in_c0_exe40 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe40,
        in_c0_exe41 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe41,
        in_c0_exe42 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe42,
        in_c0_exe43 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe43,
        in_c0_exe44 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe44,
        in_c0_exe45 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe45,
        in_c0_exe46 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe46,
        in_c0_exe47 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe47,
        in_c0_exe48 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe48,
        in_c0_exe49 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe49,
        in_c0_exe5 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe5,
        in_c0_exe50 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe50,
        in_c0_exe6 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe6,
        in_c0_exe7 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe7,
        in_c0_exe8 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe8,
        in_c0_exe9 => bb_ethash_calculate_dag_item_B1_stall_region_out_c0_exe9,
        in_dag_node_pm_0 => bb_ethash_calculate_dag_item_B1_stall_region_out_dag_node_pm_0,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_ethash_calculate_dag_item_B1_stall_region_out_valid_out,
        out_c0_exit11_0 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_0,
        out_c0_exit11_1 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_1,
        out_c0_exit11_2 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_2,
        out_c0_exit11_3 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_3,
        out_c0_exit11_4 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_4,
        out_c0_exit11_5 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_5,
        out_c0_exit11_6 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_6,
        out_c0_exit11_7 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_7,
        out_c0_exit11_8 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_8,
        out_c0_exit11_9 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_9,
        out_c0_exit11_10 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_10,
        out_c0_exit11_11 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_11,
        out_c0_exit11_12 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_12,
        out_c0_exit11_13 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_13,
        out_c0_exit11_14 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_14,
        out_c0_exit11_15 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_15,
        out_c0_exit11_16 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_16,
        out_c0_exit11_17 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_17,
        out_c0_exit11_18 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_18,
        out_c0_exit11_19 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_19,
        out_c0_exit11_20 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_20,
        out_c0_exit11_21 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_21,
        out_c0_exit11_22 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_22,
        out_c0_exit11_23 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_23,
        out_c0_exit11_24 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_24,
        out_c0_exit11_25 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_25,
        out_c0_exit11_26 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_26,
        out_c0_exit11_27 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_27,
        out_c0_exit11_28 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_28,
        out_c0_exit11_29 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_29,
        out_c0_exit11_30 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_30,
        out_c0_exit11_31 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_31,
        out_c0_exit11_32 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_32,
        out_c0_exit11_33 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_33,
        out_c0_exit11_34 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_34,
        out_c0_exit11_35 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_35,
        out_c0_exit11_36 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_36,
        out_c0_exit11_37 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_37,
        out_c0_exit11_38 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_38,
        out_c0_exit11_39 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_39,
        out_c0_exit11_40 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_40,
        out_c0_exit11_41 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_41,
        out_c0_exit11_42 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_42,
        out_c0_exit11_43 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_43,
        out_c0_exit11_44 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_44,
        out_c0_exit11_45 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_45,
        out_c0_exit11_46 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_46,
        out_c0_exit11_47 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_47,
        out_c0_exit11_48 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_48,
        out_c0_exit11_49 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_49,
        out_c0_exit11_50 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_50,
        out_acl_hw_wg_id43 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_acl_hw_wg_id43,
        out_c0_exe10 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe10,
        out_c0_exe11 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe11,
        out_c0_exe112 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe112,
        out_c0_exe116 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe116,
        out_c0_exe12 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe12,
        out_c0_exe13 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe13,
        out_c0_exe14 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe14,
        out_c0_exe15 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe15,
        out_c0_exe16 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe16,
        out_c0_exe17 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe17,
        out_c0_exe18 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe18,
        out_c0_exe19 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe19,
        out_c0_exe20 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe20,
        out_c0_exe21 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe21,
        out_c0_exe213 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe213,
        out_c0_exe22 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe22,
        out_c0_exe23 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe23,
        out_c0_exe24 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe24,
        out_c0_exe25 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe25,
        out_c0_exe26 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe26,
        out_c0_exe27 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe27,
        out_c0_exe28 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe28,
        out_c0_exe29 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe29,
        out_c0_exe30 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe30,
        out_c0_exe31 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe31,
        out_c0_exe32 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe32,
        out_c0_exe33 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe33,
        out_c0_exe34 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe34,
        out_c0_exe35 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe35,
        out_c0_exe36 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe36,
        out_c0_exe37 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe37,
        out_c0_exe38 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe38,
        out_c0_exe39 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe39,
        out_c0_exe40 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe40,
        out_c0_exe41 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe41,
        out_c0_exe42 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe42,
        out_c0_exe43 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe43,
        out_c0_exe44 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe44,
        out_c0_exe45 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe45,
        out_c0_exe46 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe46,
        out_c0_exe47 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe47,
        out_c0_exe48 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe48,
        out_c0_exe49 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe49,
        out_c0_exe5 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe5,
        out_c0_exe50 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe50,
        out_c0_exe6 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe6,
        out_c0_exe7 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe7,
        out_c0_exe8 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe8,
        out_c0_exe9 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe9,
        out_dag_node_pm_0 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_dag_node_pm_0,
        out_stall_out => ethash_calculate_dag_item_B1_branch_aunroll_x_out_stall_out,
        out_valid_out_0 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => ethash_calculate_dag_item_B1_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exit11_0(GPOUT,3)
    out_c0_exit11_0 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_0;

    -- out_c0_exit11_1(GPOUT,4)
    out_c0_exit11_1 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_1;

    -- out_c0_exit11_2(GPOUT,5)
    out_c0_exit11_2 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_2;

    -- out_c0_exit11_3(GPOUT,6)
    out_c0_exit11_3 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_3;

    -- out_c0_exit11_4(GPOUT,7)
    out_c0_exit11_4 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_4;

    -- out_c0_exit11_5(GPOUT,8)
    out_c0_exit11_5 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_5;

    -- out_c0_exit11_6(GPOUT,9)
    out_c0_exit11_6 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_6;

    -- out_c0_exit11_7(GPOUT,10)
    out_c0_exit11_7 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_7;

    -- out_c0_exit11_8(GPOUT,11)
    out_c0_exit11_8 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_8;

    -- out_c0_exit11_9(GPOUT,12)
    out_c0_exit11_9 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_9;

    -- out_c0_exit11_10(GPOUT,13)
    out_c0_exit11_10 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_10;

    -- out_c0_exit11_11(GPOUT,14)
    out_c0_exit11_11 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_11;

    -- out_c0_exit11_12(GPOUT,15)
    out_c0_exit11_12 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_12;

    -- out_c0_exit11_13(GPOUT,16)
    out_c0_exit11_13 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_13;

    -- out_c0_exit11_14(GPOUT,17)
    out_c0_exit11_14 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_14;

    -- out_c0_exit11_15(GPOUT,18)
    out_c0_exit11_15 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_15;

    -- out_c0_exit11_16(GPOUT,19)
    out_c0_exit11_16 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_16;

    -- out_c0_exit11_17(GPOUT,20)
    out_c0_exit11_17 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_17;

    -- out_c0_exit11_18(GPOUT,21)
    out_c0_exit11_18 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_18;

    -- out_c0_exit11_19(GPOUT,22)
    out_c0_exit11_19 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_19;

    -- out_c0_exit11_20(GPOUT,23)
    out_c0_exit11_20 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_20;

    -- out_c0_exit11_21(GPOUT,24)
    out_c0_exit11_21 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_21;

    -- out_c0_exit11_22(GPOUT,25)
    out_c0_exit11_22 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_22;

    -- out_c0_exit11_23(GPOUT,26)
    out_c0_exit11_23 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_23;

    -- out_c0_exit11_24(GPOUT,27)
    out_c0_exit11_24 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_24;

    -- out_c0_exit11_25(GPOUT,28)
    out_c0_exit11_25 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_25;

    -- out_c0_exit11_26(GPOUT,29)
    out_c0_exit11_26 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_26;

    -- out_c0_exit11_27(GPOUT,30)
    out_c0_exit11_27 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_27;

    -- out_c0_exit11_28(GPOUT,31)
    out_c0_exit11_28 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_28;

    -- out_c0_exit11_29(GPOUT,32)
    out_c0_exit11_29 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_29;

    -- out_c0_exit11_30(GPOUT,33)
    out_c0_exit11_30 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_30;

    -- out_c0_exit11_31(GPOUT,34)
    out_c0_exit11_31 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_31;

    -- out_c0_exit11_32(GPOUT,35)
    out_c0_exit11_32 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_32;

    -- out_c0_exit11_33(GPOUT,36)
    out_c0_exit11_33 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_33;

    -- out_c0_exit11_34(GPOUT,37)
    out_c0_exit11_34 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_34;

    -- out_c0_exit11_35(GPOUT,38)
    out_c0_exit11_35 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_35;

    -- out_c0_exit11_36(GPOUT,39)
    out_c0_exit11_36 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_36;

    -- out_c0_exit11_37(GPOUT,40)
    out_c0_exit11_37 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_37;

    -- out_c0_exit11_38(GPOUT,41)
    out_c0_exit11_38 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_38;

    -- out_c0_exit11_39(GPOUT,42)
    out_c0_exit11_39 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_39;

    -- out_c0_exit11_40(GPOUT,43)
    out_c0_exit11_40 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_40;

    -- out_c0_exit11_41(GPOUT,44)
    out_c0_exit11_41 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_41;

    -- out_c0_exit11_42(GPOUT,45)
    out_c0_exit11_42 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_42;

    -- out_c0_exit11_43(GPOUT,46)
    out_c0_exit11_43 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_43;

    -- out_c0_exit11_44(GPOUT,47)
    out_c0_exit11_44 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_44;

    -- out_c0_exit11_45(GPOUT,48)
    out_c0_exit11_45 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_45;

    -- out_c0_exit11_46(GPOUT,49)
    out_c0_exit11_46 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_46;

    -- out_c0_exit11_47(GPOUT,50)
    out_c0_exit11_47 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_47;

    -- out_c0_exit11_48(GPOUT,51)
    out_c0_exit11_48 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_48;

    -- out_c0_exit11_49(GPOUT,52)
    out_c0_exit11_49 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_49;

    -- out_c0_exit11_50(GPOUT,53)
    out_c0_exit11_50 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exit11_50;

    -- out_acl_hw_wg_id43(GPOUT,54)
    out_acl_hw_wg_id43 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_acl_hw_wg_id43;

    -- out_c0_exe10(GPOUT,55)
    out_c0_exe10 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe10;

    -- out_c0_exe11(GPOUT,56)
    out_c0_exe11 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe11;

    -- out_c0_exe112(GPOUT,57)
    out_c0_exe112 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe112;

    -- out_c0_exe116(GPOUT,58)
    out_c0_exe116 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe116;

    -- out_c0_exe12(GPOUT,59)
    out_c0_exe12 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe12;

    -- out_c0_exe13(GPOUT,60)
    out_c0_exe13 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe13;

    -- out_c0_exe14(GPOUT,61)
    out_c0_exe14 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe14;

    -- out_c0_exe15(GPOUT,62)
    out_c0_exe15 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe15;

    -- out_c0_exe16(GPOUT,63)
    out_c0_exe16 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe16;

    -- out_c0_exe17(GPOUT,64)
    out_c0_exe17 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe17;

    -- out_c0_exe18(GPOUT,65)
    out_c0_exe18 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe18;

    -- out_c0_exe19(GPOUT,66)
    out_c0_exe19 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe19;

    -- out_c0_exe20(GPOUT,67)
    out_c0_exe20 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe20;

    -- out_c0_exe21(GPOUT,68)
    out_c0_exe21 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe21;

    -- out_c0_exe213(GPOUT,69)
    out_c0_exe213 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe213;

    -- out_c0_exe22(GPOUT,70)
    out_c0_exe22 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe22;

    -- out_c0_exe23(GPOUT,71)
    out_c0_exe23 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe23;

    -- out_c0_exe24(GPOUT,72)
    out_c0_exe24 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe24;

    -- out_c0_exe25(GPOUT,73)
    out_c0_exe25 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe25;

    -- out_c0_exe26(GPOUT,74)
    out_c0_exe26 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe26;

    -- out_c0_exe27(GPOUT,75)
    out_c0_exe27 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe27;

    -- out_c0_exe28(GPOUT,76)
    out_c0_exe28 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe28;

    -- out_c0_exe29(GPOUT,77)
    out_c0_exe29 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe29;

    -- out_c0_exe30(GPOUT,78)
    out_c0_exe30 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe30;

    -- out_c0_exe31(GPOUT,79)
    out_c0_exe31 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe31;

    -- out_c0_exe32(GPOUT,80)
    out_c0_exe32 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe32;

    -- out_c0_exe33(GPOUT,81)
    out_c0_exe33 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe33;

    -- out_c0_exe34(GPOUT,82)
    out_c0_exe34 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe34;

    -- out_c0_exe35(GPOUT,83)
    out_c0_exe35 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe35;

    -- out_c0_exe36(GPOUT,84)
    out_c0_exe36 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe36;

    -- out_c0_exe37(GPOUT,85)
    out_c0_exe37 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe37;

    -- out_c0_exe38(GPOUT,86)
    out_c0_exe38 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe38;

    -- out_c0_exe39(GPOUT,87)
    out_c0_exe39 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe39;

    -- out_c0_exe40(GPOUT,88)
    out_c0_exe40 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe40;

    -- out_c0_exe41(GPOUT,89)
    out_c0_exe41 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe41;

    -- out_c0_exe42(GPOUT,90)
    out_c0_exe42 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe42;

    -- out_c0_exe43(GPOUT,91)
    out_c0_exe43 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe43;

    -- out_c0_exe44(GPOUT,92)
    out_c0_exe44 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe44;

    -- out_c0_exe45(GPOUT,93)
    out_c0_exe45 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe45;

    -- out_c0_exe46(GPOUT,94)
    out_c0_exe46 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe46;

    -- out_c0_exe47(GPOUT,95)
    out_c0_exe47 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe47;

    -- out_c0_exe48(GPOUT,96)
    out_c0_exe48 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe48;

    -- out_c0_exe49(GPOUT,97)
    out_c0_exe49 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe49;

    -- out_c0_exe5(GPOUT,98)
    out_c0_exe5 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe5;

    -- out_c0_exe50(GPOUT,99)
    out_c0_exe50 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe50;

    -- out_c0_exe6(GPOUT,100)
    out_c0_exe6 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe6;

    -- out_c0_exe7(GPOUT,101)
    out_c0_exe7 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe7;

    -- out_c0_exe8(GPOUT,102)
    out_c0_exe8 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe8;

    -- out_c0_exe9(GPOUT,103)
    out_c0_exe9 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_c0_exe9;

    -- out_dag_node_pm_0(GPOUT,104)
    out_dag_node_pm_0 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_dag_node_pm_0;

    -- out_stall_out_0(GPOUT,105)
    out_stall_out_0 <= ethash_calculate_dag_item_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,106)
    out_stall_out_1 <= ethash_calculate_dag_item_B1_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,107)
    out_valid_out_0 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,108)
    out_valid_out_1 <= ethash_calculate_dag_item_B1_branch_aunroll_x_out_valid_out_1;

END normal;
