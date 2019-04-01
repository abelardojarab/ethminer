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

-- VHDL created from bb_ethash_calculate_dag_item_B1_stall_region
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

entity bb_ethash_calculate_dag_item_B1_stall_region is
    port (
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
        out_c0_exe4 : out std_logic_vector(0 downto 0);  -- ufix1
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
        out_dag_node_pm_0 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_acl_hw_wg_id43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe116 : in std_logic_vector(31 downto 0);  -- ufix32
        in_dag_node_pm_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_r_0_i_i_ph : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01389 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01391 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01393 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01395 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01397 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01399 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01401 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01403 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01405 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01407 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01409 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01411 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01413 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01415 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01417 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01419 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01421 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01423 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01425 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01427 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01429 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11390 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11392 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11394 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11396 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11398 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11400 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11402 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11404 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11406 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11408 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11410 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11412 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11414 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11416 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11418 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11420 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11422 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11424 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11426 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11428 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11430 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B1_stall_region;

architecture normal of bb_ethash_calculate_dag_item_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_calculate_dag_item_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
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
            in_data_in_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
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
            out_data_out_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item is
        port (
            in_c0_eni47_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni47_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_eni47_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni47_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (3167 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ee : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ff : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_gg : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_hh : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ii : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_kk : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ll : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_nn : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_oo : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_pp : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_rr : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ss : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_tt : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_uu : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_vv : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ww : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q : STD_LOGIC_VECTOR (4771 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_e : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_g : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ee : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ff : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_gg : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_hh : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ii : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_kk : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ll : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_nn : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_oo : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_pp : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_rr : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ss : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_tt : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_uu : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_vv : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ww : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_xx : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_yy : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_zz : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (3167 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
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
    signal bubble_select_stall_entry_gg : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_hh : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ii : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_kk : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ll : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_nn : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_oo : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_pp : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_rr : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ss : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_tt : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_uu : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vv : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ww : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,48)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,41)
    bubble_join_stall_entry_q <= in_scalarizer_11430 & in_scalarizer_11428 & in_scalarizer_11426 & in_scalarizer_11424 & in_scalarizer_11422 & in_scalarizer_11420 & in_scalarizer_11418 & in_scalarizer_11416 & in_scalarizer_11414 & in_scalarizer_11412 & in_scalarizer_11410 & in_scalarizer_11408 & in_scalarizer_11406 & in_scalarizer_11404 & in_scalarizer_11402 & in_scalarizer_11400 & in_scalarizer_11398 & in_scalarizer_11396 & in_scalarizer_11394 & in_scalarizer_11392 & in_scalarizer_11390 & in_scalarizer_1 & in_scalarizer_01429 & in_scalarizer_01427 & in_scalarizer_01425 & in_scalarizer_01423 & in_scalarizer_01421 & in_scalarizer_01419 & in_scalarizer_01417 & in_scalarizer_01415 & in_scalarizer_01413 & in_scalarizer_01411 & in_scalarizer_01409 & in_scalarizer_01407 & in_scalarizer_01405 & in_scalarizer_01403 & in_scalarizer_01401 & in_scalarizer_01399 & in_scalarizer_01397 & in_scalarizer_01395 & in_scalarizer_01393 & in_scalarizer_01391 & in_scalarizer_01389 & in_scalarizer_0 & in_r_0_i_i_ph & in_dag_node_pm_0 & in_c0_exe116 & in_acl_hw_wg_id43;

    -- bubble_select_stall_entry(BITSELECT,42)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1727 downto 64));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1759 downto 1728));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1791 downto 1760));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1823 downto 1792));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1855 downto 1824));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1887 downto 1856));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1919 downto 1888));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1951 downto 1920));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1983 downto 1952));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2015 downto 1984));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2047 downto 2016));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2079 downto 2048));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2111 downto 2080));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2143 downto 2112));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2175 downto 2144));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2207 downto 2176));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2239 downto 2208));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2271 downto 2240));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2303 downto 2272));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2335 downto 2304));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2367 downto 2336));
    bubble_select_stall_entry_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2399 downto 2368));
    bubble_select_stall_entry_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2431 downto 2400));
    bubble_select_stall_entry_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2463 downto 2432));
    bubble_select_stall_entry_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2495 downto 2464));
    bubble_select_stall_entry_cc <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2527 downto 2496));
    bubble_select_stall_entry_dd <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2559 downto 2528));
    bubble_select_stall_entry_ee <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2591 downto 2560));
    bubble_select_stall_entry_ff <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2623 downto 2592));
    bubble_select_stall_entry_gg <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2655 downto 2624));
    bubble_select_stall_entry_hh <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2687 downto 2656));
    bubble_select_stall_entry_ii <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2719 downto 2688));
    bubble_select_stall_entry_jj <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2751 downto 2720));
    bubble_select_stall_entry_kk <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2783 downto 2752));
    bubble_select_stall_entry_ll <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2815 downto 2784));
    bubble_select_stall_entry_mm <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2847 downto 2816));
    bubble_select_stall_entry_nn <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2879 downto 2848));
    bubble_select_stall_entry_oo <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2911 downto 2880));
    bubble_select_stall_entry_pp <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2943 downto 2912));
    bubble_select_stall_entry_qq <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2975 downto 2944));
    bubble_select_stall_entry_rr <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3007 downto 2976));
    bubble_select_stall_entry_ss <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3039 downto 3008));
    bubble_select_stall_entry_tt <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3071 downto 3040));
    bubble_select_stall_entry_uu <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3103 downto 3072));
    bubble_select_stall_entry_vv <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3135 downto 3104));
    bubble_select_stall_entry_ww <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3167 downto 3136));

    -- ethash_calculate_dag_item_B1_merge_reg_aunroll_x(BLACKBOX,6)@0
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
    -- out out_data_out_42@1
    -- out out_data_out_43@1
    -- out out_data_out_44@1
    -- out out_data_out_45@1
    -- out out_data_out_46@1
    -- out out_data_out_47@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theethash_calculate_dag_item_B1_merge_reg_aunroll_x : ethash_calculate_dag_item_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_d,
        in_data_in_1 => bubble_select_stall_entry_f,
        in_data_in_2 => bubble_select_stall_entry_bb,
        in_data_in_3 => bubble_select_stall_entry_g,
        in_data_in_4 => bubble_select_stall_entry_cc,
        in_data_in_5 => bubble_select_stall_entry_h,
        in_data_in_6 => bubble_select_stall_entry_dd,
        in_data_in_7 => bubble_select_stall_entry_i,
        in_data_in_8 => bubble_select_stall_entry_ee,
        in_data_in_9 => bubble_select_stall_entry_j,
        in_data_in_10 => bubble_select_stall_entry_ff,
        in_data_in_11 => bubble_select_stall_entry_k,
        in_data_in_12 => bubble_select_stall_entry_gg,
        in_data_in_13 => bubble_select_stall_entry_l,
        in_data_in_14 => bubble_select_stall_entry_hh,
        in_data_in_15 => bubble_select_stall_entry_m,
        in_data_in_16 => bubble_select_stall_entry_ii,
        in_data_in_17 => bubble_select_stall_entry_n,
        in_data_in_18 => bubble_select_stall_entry_jj,
        in_data_in_19 => bubble_select_stall_entry_o,
        in_data_in_20 => bubble_select_stall_entry_kk,
        in_data_in_21 => bubble_select_stall_entry_p,
        in_data_in_22 => bubble_select_stall_entry_ll,
        in_data_in_23 => bubble_select_stall_entry_q,
        in_data_in_24 => bubble_select_stall_entry_mm,
        in_data_in_25 => bubble_select_stall_entry_r,
        in_data_in_26 => bubble_select_stall_entry_nn,
        in_data_in_27 => bubble_select_stall_entry_s,
        in_data_in_28 => bubble_select_stall_entry_oo,
        in_data_in_29 => bubble_select_stall_entry_t,
        in_data_in_30 => bubble_select_stall_entry_pp,
        in_data_in_31 => bubble_select_stall_entry_u,
        in_data_in_32 => bubble_select_stall_entry_qq,
        in_data_in_33 => bubble_select_stall_entry_v,
        in_data_in_34 => bubble_select_stall_entry_rr,
        in_data_in_35 => bubble_select_stall_entry_w,
        in_data_in_36 => bubble_select_stall_entry_ss,
        in_data_in_37 => bubble_select_stall_entry_x,
        in_data_in_38 => bubble_select_stall_entry_tt,
        in_data_in_39 => bubble_select_stall_entry_y,
        in_data_in_40 => bubble_select_stall_entry_uu,
        in_data_in_41 => bubble_select_stall_entry_z,
        in_data_in_42 => bubble_select_stall_entry_vv,
        in_data_in_43 => bubble_select_stall_entry_aa,
        in_data_in_44 => bubble_select_stall_entry_ww,
        in_data_in_45 => bubble_select_stall_entry_e,
        in_data_in_46 => bubble_select_stall_entry_c,
        in_data_in_47 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_11,
        out_data_out_12 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_12,
        out_data_out_13 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_13,
        out_data_out_14 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_14,
        out_data_out_15 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_15,
        out_data_out_16 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_16,
        out_data_out_17 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_17,
        out_data_out_18 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_18,
        out_data_out_19 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_19,
        out_data_out_20 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_20,
        out_data_out_21 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_21,
        out_data_out_22 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_22,
        out_data_out_23 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_23,
        out_data_out_24 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_24,
        out_data_out_25 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_25,
        out_data_out_26 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_26,
        out_data_out_27 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_27,
        out_data_out_28 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_28,
        out_data_out_29 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_29,
        out_data_out_30 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_30,
        out_data_out_31 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_31,
        out_data_out_32 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_32,
        out_data_out_33 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_33,
        out_data_out_34 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_34,
        out_data_out_35 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_35,
        out_data_out_36 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_36,
        out_data_out_37 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_37,
        out_data_out_38 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_38,
        out_data_out_39 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_39,
        out_data_out_40 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_40,
        out_data_out_41 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_41,
        out_data_out_42 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_42,
        out_data_out_43 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_43,
        out_data_out_44 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_44,
        out_data_out_45 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_45,
        out_data_out_46 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46,
        out_data_out_47 => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47,
        out_stall_out => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x(STALLENABLE,45)
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_consumed0 <= (not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backStall) and SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_o_stall) and SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_StallValid <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_backStall and SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireValid;
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_toReg0 <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_toReg1 <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_or0 <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_consumed1 and SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_or0);
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_backStall <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_V0 <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_V1 <= SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_wireValid <= ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0(STALLENABLE,50)
    -- Valid signal propagation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_V0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_s_tv_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backStall and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backEN <= not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_v_s_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backEN and SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backStall <= not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_v_s_0);
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backEN = "0") THEN
                SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_s_tv_0;
            ELSE
                SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1(STALLENABLE,51)
    -- Valid signal propagation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_V0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_s_tv_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backStall and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backEN <= not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_v_s_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backEN and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_V0;
    -- Backward Stall generation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backStall <= not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_v_s_0);
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backEN = "0") THEN
                SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_s_tv_0;
            ELSE
                SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2(STALLENABLE,52)
    -- Valid signal propagation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_V0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_s_tv_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backStall and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backEN <= not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_v_s_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backEN and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_V0;
    -- Backward Stall generation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backStall <= not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_v_s_0);
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backEN = "0") THEN
                SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_s_tv_0;
            ELSE
                SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3(STALLENABLE,53)
    -- Valid signal propagation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_V0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_0 <= SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_backStall and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backEN <= not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backEN and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_V0;
    -- Backward Stall generation
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backStall <= not (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0);
    SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "0") THEN
                SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 and SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_0;
            ELSE
                SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x(BITJOIN,34)
    bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q <= ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_45 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_44 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_43 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_42 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_41 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_40 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_39 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_38 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_37 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_36 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_35 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_34 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_33 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_32 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_31 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_30 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_29 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_28 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_27 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_26 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_25 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_24 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_23 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_22 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_21 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_20 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_19 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_18 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_17 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_16 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_15 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_14 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_13 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_12 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_11 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_10 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_9 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_8 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_7 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_6 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_5 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_4 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_3 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_2 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_1 & ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x(BITSELECT,35)
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1663 downto 0));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1695 downto 1664));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1727 downto 1696));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1759 downto 1728));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1791 downto 1760));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1823 downto 1792));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1855 downto 1824));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1887 downto 1856));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1919 downto 1888));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1951 downto 1920));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(1983 downto 1952));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2015 downto 1984));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2047 downto 2016));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2079 downto 2048));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2111 downto 2080));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2143 downto 2112));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2175 downto 2144));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2207 downto 2176));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2239 downto 2208));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2271 downto 2240));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2303 downto 2272));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2335 downto 2304));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2367 downto 2336));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2399 downto 2368));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2431 downto 2400));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2463 downto 2432));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2495 downto 2464));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2527 downto 2496));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2559 downto 2528));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ee <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2591 downto 2560));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ff <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2623 downto 2592));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_gg <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2655 downto 2624));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_hh <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2687 downto 2656));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ii <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2719 downto 2688));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_jj <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2751 downto 2720));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_kk <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2783 downto 2752));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ll <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2815 downto 2784));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_mm <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2847 downto 2816));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_nn <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2879 downto 2848));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_oo <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2911 downto 2880));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_pp <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2943 downto 2912));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_qq <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(2975 downto 2944));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_rr <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(3007 downto 2976));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ss <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(3039 downto 3008));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_tt <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(3071 downto 3040));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_uu <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(3103 downto 3072));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_vv <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(3135 downto 3104));
    bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ww <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q(3167 downto 3136));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x(BLACKBOX,7)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit11_0@5
    -- out out_c0_exit11_1@5
    -- out out_c0_exit11_2@5
    -- out out_c0_exit11_3@5
    -- out out_c0_exit11_4@5
    -- out out_c0_exit11_5@5
    -- out out_c0_exit11_6@5
    -- out out_c0_exit11_7@5
    -- out out_c0_exit11_8@5
    -- out out_c0_exit11_9@5
    -- out out_c0_exit11_10@5
    -- out out_c0_exit11_11@5
    -- out out_c0_exit11_12@5
    -- out out_c0_exit11_13@5
    -- out out_c0_exit11_14@5
    -- out out_c0_exit11_15@5
    -- out out_c0_exit11_16@5
    -- out out_c0_exit11_17@5
    -- out out_c0_exit11_18@5
    -- out out_c0_exit11_19@5
    -- out out_c0_exit11_20@5
    -- out out_c0_exit11_21@5
    -- out out_c0_exit11_22@5
    -- out out_c0_exit11_23@5
    -- out out_c0_exit11_24@5
    -- out out_c0_exit11_25@5
    -- out out_c0_exit11_26@5
    -- out out_c0_exit11_27@5
    -- out out_c0_exit11_28@5
    -- out out_c0_exit11_29@5
    -- out out_c0_exit11_30@5
    -- out out_c0_exit11_31@5
    -- out out_c0_exit11_32@5
    -- out out_c0_exit11_33@5
    -- out out_c0_exit11_34@5
    -- out out_c0_exit11_35@5
    -- out out_c0_exit11_36@5
    -- out out_c0_exit11_37@5
    -- out out_c0_exit11_38@5
    -- out out_c0_exit11_39@5
    -- out out_c0_exit11_40@5
    -- out out_c0_exit11_41@5
    -- out out_c0_exit11_42@5
    -- out out_c0_exit11_43@5
    -- out out_c0_exit11_44@5
    -- out out_c0_exit11_45@5
    -- out out_c0_exit11_46@5
    -- out out_c0_exit11_47@5
    -- out out_c0_exit11_48@5
    -- out out_c0_exit11_49@5
    -- out out_c0_exit11_50@5
    -- out out_o_stall@20000000
    -- out out_o_valid@5
    thei_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x : i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item
    PORT MAP (
        in_c0_eni47_0 => GND_q,
        in_c0_eni47_1 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_uu,
        in_c0_eni47_2 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_vv,
        in_c0_eni47_3 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_b,
        in_c0_eni47_4 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_qq,
        in_c0_eni47_5 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_oo,
        in_c0_eni47_6 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_mm,
        in_c0_eni47_7 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_kk,
        in_c0_eni47_8 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_rr,
        in_c0_eni47_9 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_pp,
        in_c0_eni47_10 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_nn,
        in_c0_eni47_11 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ll,
        in_c0_eni47_12 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ii,
        in_c0_eni47_13 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_gg,
        in_c0_eni47_14 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ee,
        in_c0_eni47_15 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_cc,
        in_c0_eni47_16 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_jj,
        in_c0_eni47_17 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_hh,
        in_c0_eni47_18 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ff,
        in_c0_eni47_19 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_dd,
        in_c0_eni47_20 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_aa,
        in_c0_eni47_21 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_y,
        in_c0_eni47_22 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_w,
        in_c0_eni47_23 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_u,
        in_c0_eni47_24 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_bb,
        in_c0_eni47_25 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_z,
        in_c0_eni47_26 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_x,
        in_c0_eni47_27 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_v,
        in_c0_eni47_28 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_s,
        in_c0_eni47_29 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ss,
        in_c0_eni47_30 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_q,
        in_c0_eni47_31 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_o,
        in_c0_eni47_32 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_m,
        in_c0_eni47_33 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_t,
        in_c0_eni47_34 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_tt,
        in_c0_eni47_35 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_r,
        in_c0_eni47_36 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_p,
        in_c0_eni47_37 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_n,
        in_c0_eni47_38 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_k,
        in_c0_eni47_39 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_i,
        in_c0_eni47_40 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_g,
        in_c0_eni47_41 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_e,
        in_c0_eni47_42 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_c,
        in_c0_eni47_43 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_l,
        in_c0_eni47_44 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_j,
        in_c0_eni47_45 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_h,
        in_c0_eni47_46 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_f,
        in_c0_eni47_47 => bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_d,
        in_i_stall => SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_backStall,
        in_i_valid => SE_out_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_V1,
        in_isolate => in_isolate,
        out_c0_exit11_0 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_0,
        out_c0_exit11_1 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_1,
        out_c0_exit11_2 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_2,
        out_c0_exit11_3 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_3,
        out_c0_exit11_4 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_4,
        out_c0_exit11_5 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_5,
        out_c0_exit11_6 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_6,
        out_c0_exit11_7 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_7,
        out_c0_exit11_8 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_8,
        out_c0_exit11_9 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_9,
        out_c0_exit11_10 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_10,
        out_c0_exit11_11 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_11,
        out_c0_exit11_12 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_12,
        out_c0_exit11_13 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_13,
        out_c0_exit11_14 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_14,
        out_c0_exit11_15 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_15,
        out_c0_exit11_16 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_16,
        out_c0_exit11_17 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_17,
        out_c0_exit11_18 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_18,
        out_c0_exit11_19 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_19,
        out_c0_exit11_20 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_20,
        out_c0_exit11_21 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_21,
        out_c0_exit11_22 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_22,
        out_c0_exit11_23 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_23,
        out_c0_exit11_24 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_24,
        out_c0_exit11_25 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_25,
        out_c0_exit11_26 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_26,
        out_c0_exit11_27 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_27,
        out_c0_exit11_28 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_28,
        out_c0_exit11_29 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_29,
        out_c0_exit11_30 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_30,
        out_c0_exit11_31 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_31,
        out_c0_exit11_32 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_32,
        out_c0_exit11_33 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_33,
        out_c0_exit11_34 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_34,
        out_c0_exit11_35 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_35,
        out_c0_exit11_36 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_36,
        out_c0_exit11_37 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_37,
        out_c0_exit11_38 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_38,
        out_c0_exit11_39 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_39,
        out_c0_exit11_40 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_40,
        out_c0_exit11_41 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_41,
        out_c0_exit11_42 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_42,
        out_c0_exit11_43 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_43,
        out_c0_exit11_44 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_44,
        out_c0_exit11_45 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_45,
        out_c0_exit11_46 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_46,
        out_c0_exit11_47 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_47,
        out_c0_exit11_48 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_48,
        out_c0_exit11_49 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_49,
        out_c0_exit11_50 => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_50,
        out_o_stall => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x(STALLENABLE,47)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_V0 <= SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_backStall <= in_stall_in or not (SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_and0 <= i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_wireValid <= SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_V0 and SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_and0;

    -- redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0(REG,21)
    redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backEN = "1") THEN
                redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1(REG,22)
    redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backEN = "1") THEN
                redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_q <= STD_LOGIC_VECTOR(redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2(REG,23)
    redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backEN = "1") THEN
                redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_q <= STD_LOGIC_VECTOR(redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3(REG,24)
    redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "1") THEN
                redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_q <= STD_LOGIC_VECTOR(redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_0(REG,25)
    redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backEN = "1") THEN
                redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_vv);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_1(REG,26)
    redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backEN = "1") THEN
                redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_1_q <= STD_LOGIC_VECTOR(redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_2(REG,27)
    redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backEN = "1") THEN
                redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_2_q <= STD_LOGIC_VECTOR(redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_3(REG,28)
    redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "1") THEN
                redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_3_q <= STD_LOGIC_VECTOR(redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x(BITJOIN,37)
    bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q <= i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_50 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_49 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_48 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_47 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_46 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_45 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_44 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_43 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_42 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_41 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_40 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_39 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_38 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_37 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_36 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_35 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_34 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_33 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_32 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_31 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_30 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_29 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_28 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_27 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_26 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_25 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_24 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_23 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_22 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_21 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_20 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_19 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_18 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_17 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_16 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_15 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_14 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_13 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_12 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_11 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_10 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_9 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_8 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_7 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_6 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_5 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_4 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_3 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_2 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_1 & i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_out_c0_exit11_0;

    -- bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x(BITSELECT,38)
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(1 downto 1));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(2 downto 2));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(1666 downto 3));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(1667 downto 1667));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3331 downto 1668));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3363 downto 3332));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3395 downto 3364));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3427 downto 3396));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3459 downto 3428));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3491 downto 3460));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3523 downto 3492));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3555 downto 3524));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3587 downto 3556));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3619 downto 3588));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3651 downto 3620));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3683 downto 3652));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3715 downto 3684));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3747 downto 3716));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3779 downto 3748));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3811 downto 3780));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3843 downto 3812));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3875 downto 3844));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3907 downto 3876));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3939 downto 3908));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(3971 downto 3940));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4003 downto 3972));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4035 downto 4004));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4067 downto 4036));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ee <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4099 downto 4068));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ff <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4131 downto 4100));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_gg <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4163 downto 4132));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_hh <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4195 downto 4164));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ii <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4227 downto 4196));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_jj <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4259 downto 4228));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_kk <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4291 downto 4260));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ll <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4323 downto 4292));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_mm <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4355 downto 4324));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_nn <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4387 downto 4356));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_oo <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4419 downto 4388));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_pp <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4451 downto 4420));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_qq <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4483 downto 4452));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_rr <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4515 downto 4484));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ss <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4547 downto 4516));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_tt <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4579 downto 4548));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_uu <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4611 downto 4580));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_vv <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4643 downto 4612));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ww <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4675 downto 4644));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_xx <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4707 downto 4676));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_yy <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4739 downto 4708));
    bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_zz <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q(4771 downto 4740));

    -- redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_0(REG,29)
    redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_0_backEN = "1") THEN
                redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_0_q <= STD_LOGIC_VECTOR(bubble_select_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_ww);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_1(REG,30)
    redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_1_backEN = "1") THEN
                redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_1_q <= STD_LOGIC_VECTOR(redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_2(REG,31)
    redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_2_backEN = "1") THEN
                redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_2_q <= STD_LOGIC_VECTOR(redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_3(REG,32)
    redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "1") THEN
                redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_3_q <= STD_LOGIC_VECTOR(redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@5
    out_acl_hw_wg_id43 <= redist2_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_47_4_3_q;
    out_c0_exe10 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_l;
    out_c0_exe11 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_m;
    out_c0_exe112 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_c;
    out_c0_exe116 <= redist1_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_46_4_3_q;
    out_c0_exe12 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_n;
    out_c0_exe13 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_o;
    out_c0_exe14 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_p;
    out_c0_exe15 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q;
    out_c0_exe16 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_r;
    out_c0_exe17 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_s;
    out_c0_exe18 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_t;
    out_c0_exe19 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_u;
    out_c0_exe20 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_v;
    out_c0_exe21 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_w;
    out_c0_exe213 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_d;
    out_c0_exe22 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_x;
    out_c0_exe23 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_y;
    out_c0_exe24 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_z;
    out_c0_exe25 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_aa;
    out_c0_exe26 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_bb;
    out_c0_exe27 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_cc;
    out_c0_exe28 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_dd;
    out_c0_exe29 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ee;
    out_c0_exe30 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ff;
    out_c0_exe31 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_gg;
    out_c0_exe32 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_hh;
    out_c0_exe33 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ii;
    out_c0_exe34 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_jj;
    out_c0_exe35 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_kk;
    out_c0_exe36 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ll;
    out_c0_exe37 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_mm;
    out_c0_exe38 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_nn;
    out_c0_exe39 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_oo;
    out_c0_exe4 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_f;
    out_c0_exe40 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_pp;
    out_c0_exe41 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_qq;
    out_c0_exe42 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_rr;
    out_c0_exe43 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ss;
    out_c0_exe44 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_tt;
    out_c0_exe45 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_uu;
    out_c0_exe46 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_vv;
    out_c0_exe47 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ww;
    out_c0_exe48 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_xx;
    out_c0_exe49 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_yy;
    out_c0_exe5 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_g;
    out_c0_exe50 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_zz;
    out_c0_exe6 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_h;
    out_c0_exe7 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_i;
    out_c0_exe8 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_j;
    out_c0_exe9 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_k;
    out_c0_exit11_0 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_b;
    out_c0_exit11_1 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_c;
    out_c0_exit11_2 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_d;
    out_c0_exit11_3 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_e;
    out_c0_exit11_4 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_f;
    out_c0_exit11_5 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_g;
    out_c0_exit11_6 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_h;
    out_c0_exit11_7 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_i;
    out_c0_exit11_8 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_j;
    out_c0_exit11_9 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_k;
    out_c0_exit11_10 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_l;
    out_c0_exit11_11 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_m;
    out_c0_exit11_12 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_n;
    out_c0_exit11_13 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_o;
    out_c0_exit11_14 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_p;
    out_c0_exit11_15 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_q;
    out_c0_exit11_16 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_r;
    out_c0_exit11_17 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_s;
    out_c0_exit11_18 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_t;
    out_c0_exit11_19 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_u;
    out_c0_exit11_20 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_v;
    out_c0_exit11_21 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_w;
    out_c0_exit11_22 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_x;
    out_c0_exit11_23 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_y;
    out_c0_exit11_24 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_z;
    out_c0_exit11_25 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_aa;
    out_c0_exit11_26 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_bb;
    out_c0_exit11_27 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_cc;
    out_c0_exit11_28 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_dd;
    out_c0_exit11_29 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ee;
    out_c0_exit11_30 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ff;
    out_c0_exit11_31 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_gg;
    out_c0_exit11_32 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_hh;
    out_c0_exit11_33 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ii;
    out_c0_exit11_34 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_jj;
    out_c0_exit11_35 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_kk;
    out_c0_exit11_36 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ll;
    out_c0_exit11_37 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_mm;
    out_c0_exit11_38 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_nn;
    out_c0_exit11_39 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_oo;
    out_c0_exit11_40 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_pp;
    out_c0_exit11_41 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_qq;
    out_c0_exit11_42 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_rr;
    out_c0_exit11_43 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ss;
    out_c0_exit11_44 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_tt;
    out_c0_exit11_45 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_uu;
    out_c0_exit11_46 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_vv;
    out_c0_exit11_47 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_ww;
    out_c0_exit11_48 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_xx;
    out_c0_exit11_49 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_yy;
    out_c0_exit11_50 <= bubble_select_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_zz;
    out_dag_node_pm_0 <= redist0_ethash_calculate_dag_item_B1_merge_reg_aunroll_x_out_data_out_0_4_3_q;
    out_valid_out <= SE_out_i_sfc_c0_for_cond_i_i_outer_ethash_calculate_dag_item_c0_enter4_ethash_calculate_dag_item_aunroll_x_V0;

    -- sync_out(GPOUT,17)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
