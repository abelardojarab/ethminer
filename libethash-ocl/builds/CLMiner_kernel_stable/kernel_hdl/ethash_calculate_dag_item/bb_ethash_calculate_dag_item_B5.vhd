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

-- VHDL created from bb_ethash_calculate_dag_item_B5
-- VHDL created on Mon Apr  1 13:52:58 2019


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

entity bb_ethash_calculate_dag_item_B5 is
    port (
        out_c0_exit169_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit169_1 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit169_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit169_3 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit169_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe10179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe111 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11180 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11219 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12181 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13182 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14183 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe15184 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe16185 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17186 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe18187 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe19188 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe20189 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21190 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21324 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe22191 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe23192 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe24193 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe25194 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe26195 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe27196 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe28197 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe29198 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe30199 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe31200 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe3172 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exe32201 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe33202 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe34203 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe35204 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe36205 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe37206 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe38207 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe39208 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe40209 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe41210 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe4173 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe42211 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe43212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe44213 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe45214 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe46215 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe47216 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe48217 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe49218 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe50219 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5174 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6175 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7176 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe8177 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9178 : out std_logic_vector(31 downto 0);  -- ufix32
        out_dag_node_pm_2 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_acl_hw_wg_id39_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id39_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe111_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe111_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11219_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11219_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe21324_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe21324_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dag_node_pm_2_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_dag_node_pm_2_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_r_0_i_i11_ph_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_r_0_i_i11_ph_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01650_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01650_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01652_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01652_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01654_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01654_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01656_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01656_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01658_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01658_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01660_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01660_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01662_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01662_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01664_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01664_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01666_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01666_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01668_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01668_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01670_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01670_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01672_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01672_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01674_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01674_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01676_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01676_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01678_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01678_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01680_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01680_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01682_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01682_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01684_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01684_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01686_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01686_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01688_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01688_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01690_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01690_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01692_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01692_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01694_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01694_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11651_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11651_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11653_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11653_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11655_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11655_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11657_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11657_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11659_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11659_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11661_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11661_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11663_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11663_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11665_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11665_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11667_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11667_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11669_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11669_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11671_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11671_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11673_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11673_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11675_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11675_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11677_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11677_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11679_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11679_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11681_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11681_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11683_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11683_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11685_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11685_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11687_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11687_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11689_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11689_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11691_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11691_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11693_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11693_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11695_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11695_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B5;

architecture normal of bb_ethash_calculate_dag_item_B5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_calculate_dag_item_B5_branch is
        port (
            in_c0_exit169_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit169_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit169_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit169_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit169_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit169_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe10179 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe111 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11180 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11219 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe12181 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe13182 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe14183 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe15184 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe16185 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe17186 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe18187 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe19188 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe20189 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21190 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21324 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2171 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe22191 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe23192 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe24193 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe25194 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe26195 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe27196 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe28197 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe29198 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe30199 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe31200 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe3172 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exe32201 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe33202 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe34203 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe35204 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe36205 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe37206 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe38207 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe39208 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe40209 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe41210 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe4173 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe42211 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe43212 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe44213 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe45214 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe46215 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe47216 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe48217 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe49218 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe50219 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe5174 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe6175 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe7176 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe8177 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe9178 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dag_node_pm_2 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit169_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_3 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit169_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe10179 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe111 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11180 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11219 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12181 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13182 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14183 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15184 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16185 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17186 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18187 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19188 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe20189 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21190 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21324 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe22191 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23192 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24193 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25194 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26195 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27196 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28197 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29198 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe30199 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe31200 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe3172 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exe32201 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe33202 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe34203 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe35204 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe36205 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe37206 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe38207 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe39208 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe40209 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe41210 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4173 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe42211 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe43212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe44213 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe45214 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe46215 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe47216 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe48217 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe49218 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe50219 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5174 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6175 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7176 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8177 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9178 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_dag_node_pm_2 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B5_stall_region is
        port (
            in_acl_hw_wg_id39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe111 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11219 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe21324 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_2 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_r_0_i_i11_ph : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01650 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01652 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01654 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01656 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01658 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01660 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01662 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01664 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01666 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01668 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01670 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01672 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01674 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01676 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01678 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01680 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01682 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01684 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01686 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01688 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01690 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01692 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01694 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11651 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11653 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11655 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11657 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11659 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11661 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11663 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11665 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11667 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11669 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11671 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11673 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11675 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11677 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11679 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11681 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11683 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11685 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11687 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11689 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11691 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11693 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11695 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit169_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_3 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit169_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe10179 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe111 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11180 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11219 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12181 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13182 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14183 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15184 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16185 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17186 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18187 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19188 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe20189 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21190 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21324 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2171 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe22191 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23192 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24193 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25194 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26195 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27196 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28197 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29198 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe30199 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe31200 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe3172 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exe32201 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe33202 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe34203 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe35204 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe36205 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe37206 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe38207 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe39208 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe40209 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe41210 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4173 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe42211 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe43212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe44213 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe45214 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe46215 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe47216 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe48217 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe49218 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe50219 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5174 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6175 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7176 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8177 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9178 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_dag_node_pm_2 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B5_merge is
        port (
            in_acl_hw_wg_id39_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id39_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe111_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe111_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11219_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe11219_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe21324_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe21324_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_2_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_dag_node_pm_2_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_r_0_i_i11_ph_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_i11_ph_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01650_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01650_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01652_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01652_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01654_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01654_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01656_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01656_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01658_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01658_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01660_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01660_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01662_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01662_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01664_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01664_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01666_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01666_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01668_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01668_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01670_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01670_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01672_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01672_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01674_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01674_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01676_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01676_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01678_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01678_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01680_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01680_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01682_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01682_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01684_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01684_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01686_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01686_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01688_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01688_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01690_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01690_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01692_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01692_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01694_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01694_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11651_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11651_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11653_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11653_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11655_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11655_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11657_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11657_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11659_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11659_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11661_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11661_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11663_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11663_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11665_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11665_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11667_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11667_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11669_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11669_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11671_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11671_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11673_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11673_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11675_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11675_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11677_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11677_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11679_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11679_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11681_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11681_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11683_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11683_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11685_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11685_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11687_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11687_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11689_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11689_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11691_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11691_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11693_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11693_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11695_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11695_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe111 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11219 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe21324 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_dag_node_pm_2 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_r_0_i_i11_ph : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01650 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01652 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01654 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01656 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01658 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01660 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01662 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01664 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01666 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01668 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01670 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01672 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01674 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01676 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01678 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01680 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01682 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01684 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01686 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01688 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01690 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01692 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01694 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11651 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11653 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11655 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11657 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11659 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11661 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11663 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11665 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11667 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11669 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11671 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11673 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11675 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11677 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11679 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11681 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11683 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11685 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11687 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11689 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11691 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11693 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11695 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_acl_hw_wg_id39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe10179 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe111 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe11180 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe11219 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe12181 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe13182 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe14183 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe15184 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe16185 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe17186 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe18187 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe19188 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe20189 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe21190 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe21324 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe22191 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe23192 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe24193 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe25194 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe26195 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe27196 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe28197 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe29198 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe30199 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe31200 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe3172 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe32201 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe33202 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe34203 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe35204 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe36205 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe37206 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe38207 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe39208 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe40209 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe41210 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe4173 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe42211 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe43212 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe44213 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe45214 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe46215 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe47216 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe48217 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe49218 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe50219 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe5174 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe6175 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe7176 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe8177 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe9178 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_dag_node_pm_2 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_acl_hw_wg_id39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe10179 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe111 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe11180 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe11219 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe12181 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe13182 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe14183 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe15184 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe16185 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe17186 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe18187 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe19188 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe20189 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe21190 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe21324 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe2171 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe22191 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe23192 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe24193 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe25194 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe26195 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe27196 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe28197 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe29198 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe30199 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe31200 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe3172 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe32201 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe33202 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe34203 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe35204 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe36205 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe37206 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe38207 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe39208 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe40209 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe41210 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe4173 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe42211 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe43212 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe44213 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe45214 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe46215 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe47216 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe48217 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe49218 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe50219 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe5174 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe6175 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe7176 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe8177 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe9178 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_dag_node_pm_2 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_acl_hw_wg_id39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_c0_exe111 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_c0_exe11219 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_c0_exe21324 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_dag_node_pm_2 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_r_0_i_i11_ph : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01650 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01652 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01654 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01656 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01658 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01660 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01662 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01664 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01666 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01668 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01670 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01672 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01674 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01676 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01678 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01680 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01682 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01684 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01686 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01688 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01690 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01692 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_01694 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11651 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11653 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11655 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11657 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11659 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11661 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11663 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11665 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11667 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11669 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11671 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11673 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11675 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11677 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11679 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11681 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11683 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11685 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11687 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11689 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11691 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11693 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_scalarizer_11695 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_calculate_dag_item_B5_merge(BLACKBOX,112)
    theethash_calculate_dag_item_B5_merge : ethash_calculate_dag_item_B5_merge
    PORT MAP (
        in_acl_hw_wg_id39_0 => in_acl_hw_wg_id39_0,
        in_acl_hw_wg_id39_1 => in_acl_hw_wg_id39_1,
        in_c0_exe111_0 => in_c0_exe111_0,
        in_c0_exe111_1 => in_c0_exe111_1,
        in_c0_exe11219_0 => in_c0_exe11219_0,
        in_c0_exe11219_1 => in_c0_exe11219_1,
        in_c0_exe21324_0 => in_c0_exe21324_0,
        in_c0_exe21324_1 => in_c0_exe21324_1,
        in_dag_node_pm_2_0 => in_dag_node_pm_2_0,
        in_dag_node_pm_2_1 => in_dag_node_pm_2_1,
        in_r_0_i_i11_ph_0 => in_r_0_i_i11_ph_0,
        in_r_0_i_i11_ph_1 => in_r_0_i_i11_ph_1,
        in_scalarizer_01650_0 => in_scalarizer_01650_0,
        in_scalarizer_01650_1 => in_scalarizer_01650_1,
        in_scalarizer_01652_0 => in_scalarizer_01652_0,
        in_scalarizer_01652_1 => in_scalarizer_01652_1,
        in_scalarizer_01654_0 => in_scalarizer_01654_0,
        in_scalarizer_01654_1 => in_scalarizer_01654_1,
        in_scalarizer_01656_0 => in_scalarizer_01656_0,
        in_scalarizer_01656_1 => in_scalarizer_01656_1,
        in_scalarizer_01658_0 => in_scalarizer_01658_0,
        in_scalarizer_01658_1 => in_scalarizer_01658_1,
        in_scalarizer_01660_0 => in_scalarizer_01660_0,
        in_scalarizer_01660_1 => in_scalarizer_01660_1,
        in_scalarizer_01662_0 => in_scalarizer_01662_0,
        in_scalarizer_01662_1 => in_scalarizer_01662_1,
        in_scalarizer_01664_0 => in_scalarizer_01664_0,
        in_scalarizer_01664_1 => in_scalarizer_01664_1,
        in_scalarizer_01666_0 => in_scalarizer_01666_0,
        in_scalarizer_01666_1 => in_scalarizer_01666_1,
        in_scalarizer_01668_0 => in_scalarizer_01668_0,
        in_scalarizer_01668_1 => in_scalarizer_01668_1,
        in_scalarizer_01670_0 => in_scalarizer_01670_0,
        in_scalarizer_01670_1 => in_scalarizer_01670_1,
        in_scalarizer_01672_0 => in_scalarizer_01672_0,
        in_scalarizer_01672_1 => in_scalarizer_01672_1,
        in_scalarizer_01674_0 => in_scalarizer_01674_0,
        in_scalarizer_01674_1 => in_scalarizer_01674_1,
        in_scalarizer_01676_0 => in_scalarizer_01676_0,
        in_scalarizer_01676_1 => in_scalarizer_01676_1,
        in_scalarizer_01678_0 => in_scalarizer_01678_0,
        in_scalarizer_01678_1 => in_scalarizer_01678_1,
        in_scalarizer_01680_0 => in_scalarizer_01680_0,
        in_scalarizer_01680_1 => in_scalarizer_01680_1,
        in_scalarizer_01682_0 => in_scalarizer_01682_0,
        in_scalarizer_01682_1 => in_scalarizer_01682_1,
        in_scalarizer_01684_0 => in_scalarizer_01684_0,
        in_scalarizer_01684_1 => in_scalarizer_01684_1,
        in_scalarizer_01686_0 => in_scalarizer_01686_0,
        in_scalarizer_01686_1 => in_scalarizer_01686_1,
        in_scalarizer_01688_0 => in_scalarizer_01688_0,
        in_scalarizer_01688_1 => in_scalarizer_01688_1,
        in_scalarizer_01690_0 => in_scalarizer_01690_0,
        in_scalarizer_01690_1 => in_scalarizer_01690_1,
        in_scalarizer_01692_0 => in_scalarizer_01692_0,
        in_scalarizer_01692_1 => in_scalarizer_01692_1,
        in_scalarizer_01694_0 => in_scalarizer_01694_0,
        in_scalarizer_01694_1 => in_scalarizer_01694_1,
        in_scalarizer_11651_0 => in_scalarizer_11651_0,
        in_scalarizer_11651_1 => in_scalarizer_11651_1,
        in_scalarizer_11653_0 => in_scalarizer_11653_0,
        in_scalarizer_11653_1 => in_scalarizer_11653_1,
        in_scalarizer_11655_0 => in_scalarizer_11655_0,
        in_scalarizer_11655_1 => in_scalarizer_11655_1,
        in_scalarizer_11657_0 => in_scalarizer_11657_0,
        in_scalarizer_11657_1 => in_scalarizer_11657_1,
        in_scalarizer_11659_0 => in_scalarizer_11659_0,
        in_scalarizer_11659_1 => in_scalarizer_11659_1,
        in_scalarizer_11661_0 => in_scalarizer_11661_0,
        in_scalarizer_11661_1 => in_scalarizer_11661_1,
        in_scalarizer_11663_0 => in_scalarizer_11663_0,
        in_scalarizer_11663_1 => in_scalarizer_11663_1,
        in_scalarizer_11665_0 => in_scalarizer_11665_0,
        in_scalarizer_11665_1 => in_scalarizer_11665_1,
        in_scalarizer_11667_0 => in_scalarizer_11667_0,
        in_scalarizer_11667_1 => in_scalarizer_11667_1,
        in_scalarizer_11669_0 => in_scalarizer_11669_0,
        in_scalarizer_11669_1 => in_scalarizer_11669_1,
        in_scalarizer_11671_0 => in_scalarizer_11671_0,
        in_scalarizer_11671_1 => in_scalarizer_11671_1,
        in_scalarizer_11673_0 => in_scalarizer_11673_0,
        in_scalarizer_11673_1 => in_scalarizer_11673_1,
        in_scalarizer_11675_0 => in_scalarizer_11675_0,
        in_scalarizer_11675_1 => in_scalarizer_11675_1,
        in_scalarizer_11677_0 => in_scalarizer_11677_0,
        in_scalarizer_11677_1 => in_scalarizer_11677_1,
        in_scalarizer_11679_0 => in_scalarizer_11679_0,
        in_scalarizer_11679_1 => in_scalarizer_11679_1,
        in_scalarizer_11681_0 => in_scalarizer_11681_0,
        in_scalarizer_11681_1 => in_scalarizer_11681_1,
        in_scalarizer_11683_0 => in_scalarizer_11683_0,
        in_scalarizer_11683_1 => in_scalarizer_11683_1,
        in_scalarizer_11685_0 => in_scalarizer_11685_0,
        in_scalarizer_11685_1 => in_scalarizer_11685_1,
        in_scalarizer_11687_0 => in_scalarizer_11687_0,
        in_scalarizer_11687_1 => in_scalarizer_11687_1,
        in_scalarizer_11689_0 => in_scalarizer_11689_0,
        in_scalarizer_11689_1 => in_scalarizer_11689_1,
        in_scalarizer_11691_0 => in_scalarizer_11691_0,
        in_scalarizer_11691_1 => in_scalarizer_11691_1,
        in_scalarizer_11693_0 => in_scalarizer_11693_0,
        in_scalarizer_11693_1 => in_scalarizer_11693_1,
        in_scalarizer_11695_0 => in_scalarizer_11695_0,
        in_scalarizer_11695_1 => in_scalarizer_11695_1,
        in_stall_in => bb_ethash_calculate_dag_item_B5_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_acl_hw_wg_id39 => ethash_calculate_dag_item_B5_merge_out_acl_hw_wg_id39,
        out_c0_exe111 => ethash_calculate_dag_item_B5_merge_out_c0_exe111,
        out_c0_exe11219 => ethash_calculate_dag_item_B5_merge_out_c0_exe11219,
        out_c0_exe21324 => ethash_calculate_dag_item_B5_merge_out_c0_exe21324,
        out_dag_node_pm_2 => ethash_calculate_dag_item_B5_merge_out_dag_node_pm_2,
        out_r_0_i_i11_ph => ethash_calculate_dag_item_B5_merge_out_r_0_i_i11_ph,
        out_scalarizer_01650 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01650,
        out_scalarizer_01652 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01652,
        out_scalarizer_01654 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01654,
        out_scalarizer_01656 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01656,
        out_scalarizer_01658 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01658,
        out_scalarizer_01660 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01660,
        out_scalarizer_01662 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01662,
        out_scalarizer_01664 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01664,
        out_scalarizer_01666 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01666,
        out_scalarizer_01668 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01668,
        out_scalarizer_01670 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01670,
        out_scalarizer_01672 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01672,
        out_scalarizer_01674 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01674,
        out_scalarizer_01676 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01676,
        out_scalarizer_01678 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01678,
        out_scalarizer_01680 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01680,
        out_scalarizer_01682 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01682,
        out_scalarizer_01684 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01684,
        out_scalarizer_01686 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01686,
        out_scalarizer_01688 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01688,
        out_scalarizer_01690 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01690,
        out_scalarizer_01692 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01692,
        out_scalarizer_01694 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01694,
        out_scalarizer_11651 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11651,
        out_scalarizer_11653 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11653,
        out_scalarizer_11655 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11655,
        out_scalarizer_11657 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11657,
        out_scalarizer_11659 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11659,
        out_scalarizer_11661 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11661,
        out_scalarizer_11663 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11663,
        out_scalarizer_11665 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11665,
        out_scalarizer_11667 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11667,
        out_scalarizer_11669 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11669,
        out_scalarizer_11671 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11671,
        out_scalarizer_11673 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11673,
        out_scalarizer_11675 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11675,
        out_scalarizer_11677 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11677,
        out_scalarizer_11679 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11679,
        out_scalarizer_11681 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11681,
        out_scalarizer_11683 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11683,
        out_scalarizer_11685 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11685,
        out_scalarizer_11687 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11687,
        out_scalarizer_11689 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11689,
        out_scalarizer_11691 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11691,
        out_scalarizer_11693 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11693,
        out_scalarizer_11695 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11695,
        out_stall_out_0 => ethash_calculate_dag_item_B5_merge_out_stall_out_0,
        out_stall_out_1 => ethash_calculate_dag_item_B5_merge_out_stall_out_1,
        out_valid_out => ethash_calculate_dag_item_B5_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B5_stall_region(BLACKBOX,111)
    thebb_ethash_calculate_dag_item_B5_stall_region : bb_ethash_calculate_dag_item_B5_stall_region
    PORT MAP (
        in_acl_hw_wg_id39 => ethash_calculate_dag_item_B5_merge_out_acl_hw_wg_id39,
        in_c0_exe111 => ethash_calculate_dag_item_B5_merge_out_c0_exe111,
        in_c0_exe11219 => ethash_calculate_dag_item_B5_merge_out_c0_exe11219,
        in_c0_exe21324 => ethash_calculate_dag_item_B5_merge_out_c0_exe21324,
        in_dag_node_pm_2 => ethash_calculate_dag_item_B5_merge_out_dag_node_pm_2,
        in_r_0_i_i11_ph => ethash_calculate_dag_item_B5_merge_out_r_0_i_i11_ph,
        in_scalarizer_01650 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01650,
        in_scalarizer_01652 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01652,
        in_scalarizer_01654 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01654,
        in_scalarizer_01656 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01656,
        in_scalarizer_01658 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01658,
        in_scalarizer_01660 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01660,
        in_scalarizer_01662 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01662,
        in_scalarizer_01664 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01664,
        in_scalarizer_01666 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01666,
        in_scalarizer_01668 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01668,
        in_scalarizer_01670 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01670,
        in_scalarizer_01672 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01672,
        in_scalarizer_01674 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01674,
        in_scalarizer_01676 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01676,
        in_scalarizer_01678 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01678,
        in_scalarizer_01680 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01680,
        in_scalarizer_01682 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01682,
        in_scalarizer_01684 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01684,
        in_scalarizer_01686 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01686,
        in_scalarizer_01688 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01688,
        in_scalarizer_01690 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01690,
        in_scalarizer_01692 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01692,
        in_scalarizer_01694 => ethash_calculate_dag_item_B5_merge_out_scalarizer_01694,
        in_scalarizer_11651 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11651,
        in_scalarizer_11653 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11653,
        in_scalarizer_11655 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11655,
        in_scalarizer_11657 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11657,
        in_scalarizer_11659 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11659,
        in_scalarizer_11661 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11661,
        in_scalarizer_11663 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11663,
        in_scalarizer_11665 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11665,
        in_scalarizer_11667 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11667,
        in_scalarizer_11669 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11669,
        in_scalarizer_11671 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11671,
        in_scalarizer_11673 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11673,
        in_scalarizer_11675 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11675,
        in_scalarizer_11677 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11677,
        in_scalarizer_11679 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11679,
        in_scalarizer_11681 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11681,
        in_scalarizer_11683 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11683,
        in_scalarizer_11685 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11685,
        in_scalarizer_11687 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11687,
        in_scalarizer_11689 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11689,
        in_scalarizer_11691 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11691,
        in_scalarizer_11693 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11693,
        in_scalarizer_11695 => ethash_calculate_dag_item_B5_merge_out_scalarizer_11695,
        in_stall_in => ethash_calculate_dag_item_B5_branch_aunroll_x_out_stall_out,
        in_valid_in => ethash_calculate_dag_item_B5_merge_out_valid_out,
        out_c0_exit169_0 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_0,
        out_c0_exit169_1 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_1,
        out_c0_exit169_2 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_2,
        out_c0_exit169_3 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_3,
        out_c0_exit169_4 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_4,
        out_c0_exit169_5 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_5,
        out_c0_exit169_6 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_6,
        out_c0_exit169_7 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_7,
        out_c0_exit169_8 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_8,
        out_c0_exit169_9 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_9,
        out_c0_exit169_10 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_10,
        out_c0_exit169_11 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_11,
        out_c0_exit169_12 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_12,
        out_c0_exit169_13 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_13,
        out_c0_exit169_14 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_14,
        out_c0_exit169_15 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_15,
        out_c0_exit169_16 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_16,
        out_c0_exit169_17 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_17,
        out_c0_exit169_18 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_18,
        out_c0_exit169_19 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_19,
        out_c0_exit169_20 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_20,
        out_c0_exit169_21 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_21,
        out_c0_exit169_22 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_22,
        out_c0_exit169_23 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_23,
        out_c0_exit169_24 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_24,
        out_c0_exit169_25 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_25,
        out_c0_exit169_26 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_26,
        out_c0_exit169_27 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_27,
        out_c0_exit169_28 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_28,
        out_c0_exit169_29 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_29,
        out_c0_exit169_30 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_30,
        out_c0_exit169_31 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_31,
        out_c0_exit169_32 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_32,
        out_c0_exit169_33 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_33,
        out_c0_exit169_34 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_34,
        out_c0_exit169_35 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_35,
        out_c0_exit169_36 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_36,
        out_c0_exit169_37 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_37,
        out_c0_exit169_38 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_38,
        out_c0_exit169_39 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_39,
        out_c0_exit169_40 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_40,
        out_c0_exit169_41 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_41,
        out_c0_exit169_42 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_42,
        out_c0_exit169_43 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_43,
        out_c0_exit169_44 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_44,
        out_c0_exit169_45 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_45,
        out_c0_exit169_46 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_46,
        out_c0_exit169_47 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_47,
        out_c0_exit169_48 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_48,
        out_c0_exit169_49 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_49,
        out_c0_exit169_50 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_50,
        out_acl_hw_wg_id39 => bb_ethash_calculate_dag_item_B5_stall_region_out_acl_hw_wg_id39,
        out_c0_exe10179 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe10179,
        out_c0_exe111 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe111,
        out_c0_exe11180 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe11180,
        out_c0_exe11219 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe11219,
        out_c0_exe12181 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe12181,
        out_c0_exe13182 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe13182,
        out_c0_exe14183 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe14183,
        out_c0_exe15184 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe15184,
        out_c0_exe16185 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe16185,
        out_c0_exe17186 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe17186,
        out_c0_exe18187 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe18187,
        out_c0_exe19188 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe19188,
        out_c0_exe20189 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe20189,
        out_c0_exe21190 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe21190,
        out_c0_exe21324 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe21324,
        out_c0_exe2171 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe2171,
        out_c0_exe22191 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe22191,
        out_c0_exe23192 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe23192,
        out_c0_exe24193 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe24193,
        out_c0_exe25194 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe25194,
        out_c0_exe26195 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe26195,
        out_c0_exe27196 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe27196,
        out_c0_exe28197 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe28197,
        out_c0_exe29198 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe29198,
        out_c0_exe30199 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe30199,
        out_c0_exe31200 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe31200,
        out_c0_exe3172 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe3172,
        out_c0_exe32201 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe32201,
        out_c0_exe33202 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe33202,
        out_c0_exe34203 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe34203,
        out_c0_exe35204 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe35204,
        out_c0_exe36205 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe36205,
        out_c0_exe37206 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe37206,
        out_c0_exe38207 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe38207,
        out_c0_exe39208 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe39208,
        out_c0_exe40209 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe40209,
        out_c0_exe41210 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe41210,
        out_c0_exe4173 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe4173,
        out_c0_exe42211 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe42211,
        out_c0_exe43212 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe43212,
        out_c0_exe44213 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe44213,
        out_c0_exe45214 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe45214,
        out_c0_exe46215 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe46215,
        out_c0_exe47216 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe47216,
        out_c0_exe48217 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe48217,
        out_c0_exe49218 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe49218,
        out_c0_exe50219 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe50219,
        out_c0_exe5174 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe5174,
        out_c0_exe6175 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe6175,
        out_c0_exe7176 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe7176,
        out_c0_exe8177 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe8177,
        out_c0_exe9178 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe9178,
        out_dag_node_pm_2 => bb_ethash_calculate_dag_item_B5_stall_region_out_dag_node_pm_2,
        out_stall_out => bb_ethash_calculate_dag_item_B5_stall_region_out_stall_out,
        out_valid_out => bb_ethash_calculate_dag_item_B5_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_calculate_dag_item_B5_branch_aunroll_x(BLACKBOX,2)
    theethash_calculate_dag_item_B5_branch_aunroll_x : ethash_calculate_dag_item_B5_branch
    PORT MAP (
        in_c0_exit169_0 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_0,
        in_c0_exit169_1 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_1,
        in_c0_exit169_2 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_2,
        in_c0_exit169_3 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_3,
        in_c0_exit169_4 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_4,
        in_c0_exit169_5 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_5,
        in_c0_exit169_6 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_6,
        in_c0_exit169_7 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_7,
        in_c0_exit169_8 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_8,
        in_c0_exit169_9 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_9,
        in_c0_exit169_10 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_10,
        in_c0_exit169_11 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_11,
        in_c0_exit169_12 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_12,
        in_c0_exit169_13 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_13,
        in_c0_exit169_14 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_14,
        in_c0_exit169_15 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_15,
        in_c0_exit169_16 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_16,
        in_c0_exit169_17 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_17,
        in_c0_exit169_18 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_18,
        in_c0_exit169_19 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_19,
        in_c0_exit169_20 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_20,
        in_c0_exit169_21 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_21,
        in_c0_exit169_22 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_22,
        in_c0_exit169_23 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_23,
        in_c0_exit169_24 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_24,
        in_c0_exit169_25 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_25,
        in_c0_exit169_26 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_26,
        in_c0_exit169_27 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_27,
        in_c0_exit169_28 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_28,
        in_c0_exit169_29 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_29,
        in_c0_exit169_30 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_30,
        in_c0_exit169_31 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_31,
        in_c0_exit169_32 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_32,
        in_c0_exit169_33 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_33,
        in_c0_exit169_34 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_34,
        in_c0_exit169_35 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_35,
        in_c0_exit169_36 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_36,
        in_c0_exit169_37 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_37,
        in_c0_exit169_38 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_38,
        in_c0_exit169_39 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_39,
        in_c0_exit169_40 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_40,
        in_c0_exit169_41 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_41,
        in_c0_exit169_42 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_42,
        in_c0_exit169_43 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_43,
        in_c0_exit169_44 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_44,
        in_c0_exit169_45 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_45,
        in_c0_exit169_46 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_46,
        in_c0_exit169_47 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_47,
        in_c0_exit169_48 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_48,
        in_c0_exit169_49 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_49,
        in_c0_exit169_50 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exit169_50,
        in_acl_hw_wg_id39 => bb_ethash_calculate_dag_item_B5_stall_region_out_acl_hw_wg_id39,
        in_c0_exe10179 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe10179,
        in_c0_exe111 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe111,
        in_c0_exe11180 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe11180,
        in_c0_exe11219 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe11219,
        in_c0_exe12181 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe12181,
        in_c0_exe13182 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe13182,
        in_c0_exe14183 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe14183,
        in_c0_exe15184 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe15184,
        in_c0_exe16185 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe16185,
        in_c0_exe17186 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe17186,
        in_c0_exe18187 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe18187,
        in_c0_exe19188 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe19188,
        in_c0_exe20189 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe20189,
        in_c0_exe21190 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe21190,
        in_c0_exe21324 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe21324,
        in_c0_exe2171 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe2171,
        in_c0_exe22191 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe22191,
        in_c0_exe23192 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe23192,
        in_c0_exe24193 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe24193,
        in_c0_exe25194 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe25194,
        in_c0_exe26195 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe26195,
        in_c0_exe27196 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe27196,
        in_c0_exe28197 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe28197,
        in_c0_exe29198 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe29198,
        in_c0_exe30199 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe30199,
        in_c0_exe31200 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe31200,
        in_c0_exe3172 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe3172,
        in_c0_exe32201 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe32201,
        in_c0_exe33202 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe33202,
        in_c0_exe34203 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe34203,
        in_c0_exe35204 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe35204,
        in_c0_exe36205 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe36205,
        in_c0_exe37206 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe37206,
        in_c0_exe38207 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe38207,
        in_c0_exe39208 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe39208,
        in_c0_exe40209 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe40209,
        in_c0_exe41210 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe41210,
        in_c0_exe4173 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe4173,
        in_c0_exe42211 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe42211,
        in_c0_exe43212 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe43212,
        in_c0_exe44213 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe44213,
        in_c0_exe45214 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe45214,
        in_c0_exe46215 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe46215,
        in_c0_exe47216 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe47216,
        in_c0_exe48217 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe48217,
        in_c0_exe49218 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe49218,
        in_c0_exe50219 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe50219,
        in_c0_exe5174 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe5174,
        in_c0_exe6175 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe6175,
        in_c0_exe7176 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe7176,
        in_c0_exe8177 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe8177,
        in_c0_exe9178 => bb_ethash_calculate_dag_item_B5_stall_region_out_c0_exe9178,
        in_dag_node_pm_2 => bb_ethash_calculate_dag_item_B5_stall_region_out_dag_node_pm_2,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_ethash_calculate_dag_item_B5_stall_region_out_valid_out,
        out_c0_exit169_0 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_0,
        out_c0_exit169_1 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_1,
        out_c0_exit169_2 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_2,
        out_c0_exit169_3 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_3,
        out_c0_exit169_4 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_4,
        out_c0_exit169_5 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_5,
        out_c0_exit169_6 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_6,
        out_c0_exit169_7 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_7,
        out_c0_exit169_8 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_8,
        out_c0_exit169_9 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_9,
        out_c0_exit169_10 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_10,
        out_c0_exit169_11 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_11,
        out_c0_exit169_12 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_12,
        out_c0_exit169_13 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_13,
        out_c0_exit169_14 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_14,
        out_c0_exit169_15 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_15,
        out_c0_exit169_16 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_16,
        out_c0_exit169_17 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_17,
        out_c0_exit169_18 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_18,
        out_c0_exit169_19 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_19,
        out_c0_exit169_20 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_20,
        out_c0_exit169_21 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_21,
        out_c0_exit169_22 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_22,
        out_c0_exit169_23 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_23,
        out_c0_exit169_24 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_24,
        out_c0_exit169_25 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_25,
        out_c0_exit169_26 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_26,
        out_c0_exit169_27 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_27,
        out_c0_exit169_28 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_28,
        out_c0_exit169_29 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_29,
        out_c0_exit169_30 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_30,
        out_c0_exit169_31 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_31,
        out_c0_exit169_32 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_32,
        out_c0_exit169_33 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_33,
        out_c0_exit169_34 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_34,
        out_c0_exit169_35 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_35,
        out_c0_exit169_36 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_36,
        out_c0_exit169_37 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_37,
        out_c0_exit169_38 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_38,
        out_c0_exit169_39 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_39,
        out_c0_exit169_40 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_40,
        out_c0_exit169_41 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_41,
        out_c0_exit169_42 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_42,
        out_c0_exit169_43 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_43,
        out_c0_exit169_44 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_44,
        out_c0_exit169_45 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_45,
        out_c0_exit169_46 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_46,
        out_c0_exit169_47 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_47,
        out_c0_exit169_48 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_48,
        out_c0_exit169_49 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_49,
        out_c0_exit169_50 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_50,
        out_acl_hw_wg_id39 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_acl_hw_wg_id39,
        out_c0_exe10179 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe10179,
        out_c0_exe111 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe111,
        out_c0_exe11180 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe11180,
        out_c0_exe11219 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe11219,
        out_c0_exe12181 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe12181,
        out_c0_exe13182 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe13182,
        out_c0_exe14183 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe14183,
        out_c0_exe15184 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe15184,
        out_c0_exe16185 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe16185,
        out_c0_exe17186 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe17186,
        out_c0_exe18187 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe18187,
        out_c0_exe19188 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe19188,
        out_c0_exe20189 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe20189,
        out_c0_exe21190 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe21190,
        out_c0_exe21324 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe21324,
        out_c0_exe22191 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe22191,
        out_c0_exe23192 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe23192,
        out_c0_exe24193 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe24193,
        out_c0_exe25194 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe25194,
        out_c0_exe26195 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe26195,
        out_c0_exe27196 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe27196,
        out_c0_exe28197 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe28197,
        out_c0_exe29198 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe29198,
        out_c0_exe30199 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe30199,
        out_c0_exe31200 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe31200,
        out_c0_exe3172 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe3172,
        out_c0_exe32201 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe32201,
        out_c0_exe33202 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe33202,
        out_c0_exe34203 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe34203,
        out_c0_exe35204 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe35204,
        out_c0_exe36205 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe36205,
        out_c0_exe37206 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe37206,
        out_c0_exe38207 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe38207,
        out_c0_exe39208 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe39208,
        out_c0_exe40209 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe40209,
        out_c0_exe41210 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe41210,
        out_c0_exe4173 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe4173,
        out_c0_exe42211 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe42211,
        out_c0_exe43212 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe43212,
        out_c0_exe44213 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe44213,
        out_c0_exe45214 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe45214,
        out_c0_exe46215 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe46215,
        out_c0_exe47216 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe47216,
        out_c0_exe48217 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe48217,
        out_c0_exe49218 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe49218,
        out_c0_exe50219 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe50219,
        out_c0_exe5174 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe5174,
        out_c0_exe6175 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe6175,
        out_c0_exe7176 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe7176,
        out_c0_exe8177 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe8177,
        out_c0_exe9178 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe9178,
        out_dag_node_pm_2 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_dag_node_pm_2,
        out_stall_out => ethash_calculate_dag_item_B5_branch_aunroll_x_out_stall_out,
        out_valid_out_0 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => ethash_calculate_dag_item_B5_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exit169_0(GPOUT,3)
    out_c0_exit169_0 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_0;

    -- out_c0_exit169_1(GPOUT,4)
    out_c0_exit169_1 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_1;

    -- out_c0_exit169_2(GPOUT,5)
    out_c0_exit169_2 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_2;

    -- out_c0_exit169_3(GPOUT,6)
    out_c0_exit169_3 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_3;

    -- out_c0_exit169_4(GPOUT,7)
    out_c0_exit169_4 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_4;

    -- out_c0_exit169_5(GPOUT,8)
    out_c0_exit169_5 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_5;

    -- out_c0_exit169_6(GPOUT,9)
    out_c0_exit169_6 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_6;

    -- out_c0_exit169_7(GPOUT,10)
    out_c0_exit169_7 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_7;

    -- out_c0_exit169_8(GPOUT,11)
    out_c0_exit169_8 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_8;

    -- out_c0_exit169_9(GPOUT,12)
    out_c0_exit169_9 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_9;

    -- out_c0_exit169_10(GPOUT,13)
    out_c0_exit169_10 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_10;

    -- out_c0_exit169_11(GPOUT,14)
    out_c0_exit169_11 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_11;

    -- out_c0_exit169_12(GPOUT,15)
    out_c0_exit169_12 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_12;

    -- out_c0_exit169_13(GPOUT,16)
    out_c0_exit169_13 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_13;

    -- out_c0_exit169_14(GPOUT,17)
    out_c0_exit169_14 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_14;

    -- out_c0_exit169_15(GPOUT,18)
    out_c0_exit169_15 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_15;

    -- out_c0_exit169_16(GPOUT,19)
    out_c0_exit169_16 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_16;

    -- out_c0_exit169_17(GPOUT,20)
    out_c0_exit169_17 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_17;

    -- out_c0_exit169_18(GPOUT,21)
    out_c0_exit169_18 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_18;

    -- out_c0_exit169_19(GPOUT,22)
    out_c0_exit169_19 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_19;

    -- out_c0_exit169_20(GPOUT,23)
    out_c0_exit169_20 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_20;

    -- out_c0_exit169_21(GPOUT,24)
    out_c0_exit169_21 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_21;

    -- out_c0_exit169_22(GPOUT,25)
    out_c0_exit169_22 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_22;

    -- out_c0_exit169_23(GPOUT,26)
    out_c0_exit169_23 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_23;

    -- out_c0_exit169_24(GPOUT,27)
    out_c0_exit169_24 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_24;

    -- out_c0_exit169_25(GPOUT,28)
    out_c0_exit169_25 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_25;

    -- out_c0_exit169_26(GPOUT,29)
    out_c0_exit169_26 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_26;

    -- out_c0_exit169_27(GPOUT,30)
    out_c0_exit169_27 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_27;

    -- out_c0_exit169_28(GPOUT,31)
    out_c0_exit169_28 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_28;

    -- out_c0_exit169_29(GPOUT,32)
    out_c0_exit169_29 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_29;

    -- out_c0_exit169_30(GPOUT,33)
    out_c0_exit169_30 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_30;

    -- out_c0_exit169_31(GPOUT,34)
    out_c0_exit169_31 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_31;

    -- out_c0_exit169_32(GPOUT,35)
    out_c0_exit169_32 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_32;

    -- out_c0_exit169_33(GPOUT,36)
    out_c0_exit169_33 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_33;

    -- out_c0_exit169_34(GPOUT,37)
    out_c0_exit169_34 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_34;

    -- out_c0_exit169_35(GPOUT,38)
    out_c0_exit169_35 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_35;

    -- out_c0_exit169_36(GPOUT,39)
    out_c0_exit169_36 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_36;

    -- out_c0_exit169_37(GPOUT,40)
    out_c0_exit169_37 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_37;

    -- out_c0_exit169_38(GPOUT,41)
    out_c0_exit169_38 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_38;

    -- out_c0_exit169_39(GPOUT,42)
    out_c0_exit169_39 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_39;

    -- out_c0_exit169_40(GPOUT,43)
    out_c0_exit169_40 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_40;

    -- out_c0_exit169_41(GPOUT,44)
    out_c0_exit169_41 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_41;

    -- out_c0_exit169_42(GPOUT,45)
    out_c0_exit169_42 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_42;

    -- out_c0_exit169_43(GPOUT,46)
    out_c0_exit169_43 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_43;

    -- out_c0_exit169_44(GPOUT,47)
    out_c0_exit169_44 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_44;

    -- out_c0_exit169_45(GPOUT,48)
    out_c0_exit169_45 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_45;

    -- out_c0_exit169_46(GPOUT,49)
    out_c0_exit169_46 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_46;

    -- out_c0_exit169_47(GPOUT,50)
    out_c0_exit169_47 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_47;

    -- out_c0_exit169_48(GPOUT,51)
    out_c0_exit169_48 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_48;

    -- out_c0_exit169_49(GPOUT,52)
    out_c0_exit169_49 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_49;

    -- out_c0_exit169_50(GPOUT,53)
    out_c0_exit169_50 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exit169_50;

    -- out_acl_hw_wg_id39(GPOUT,54)
    out_acl_hw_wg_id39 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_acl_hw_wg_id39;

    -- out_c0_exe10179(GPOUT,55)
    out_c0_exe10179 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe10179;

    -- out_c0_exe111(GPOUT,56)
    out_c0_exe111 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe111;

    -- out_c0_exe11180(GPOUT,57)
    out_c0_exe11180 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe11180;

    -- out_c0_exe11219(GPOUT,58)
    out_c0_exe11219 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe11219;

    -- out_c0_exe12181(GPOUT,59)
    out_c0_exe12181 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe12181;

    -- out_c0_exe13182(GPOUT,60)
    out_c0_exe13182 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe13182;

    -- out_c0_exe14183(GPOUT,61)
    out_c0_exe14183 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe14183;

    -- out_c0_exe15184(GPOUT,62)
    out_c0_exe15184 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe15184;

    -- out_c0_exe16185(GPOUT,63)
    out_c0_exe16185 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe16185;

    -- out_c0_exe17186(GPOUT,64)
    out_c0_exe17186 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe17186;

    -- out_c0_exe18187(GPOUT,65)
    out_c0_exe18187 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe18187;

    -- out_c0_exe19188(GPOUT,66)
    out_c0_exe19188 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe19188;

    -- out_c0_exe20189(GPOUT,67)
    out_c0_exe20189 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe20189;

    -- out_c0_exe21190(GPOUT,68)
    out_c0_exe21190 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe21190;

    -- out_c0_exe21324(GPOUT,69)
    out_c0_exe21324 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe21324;

    -- out_c0_exe22191(GPOUT,70)
    out_c0_exe22191 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe22191;

    -- out_c0_exe23192(GPOUT,71)
    out_c0_exe23192 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe23192;

    -- out_c0_exe24193(GPOUT,72)
    out_c0_exe24193 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe24193;

    -- out_c0_exe25194(GPOUT,73)
    out_c0_exe25194 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe25194;

    -- out_c0_exe26195(GPOUT,74)
    out_c0_exe26195 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe26195;

    -- out_c0_exe27196(GPOUT,75)
    out_c0_exe27196 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe27196;

    -- out_c0_exe28197(GPOUT,76)
    out_c0_exe28197 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe28197;

    -- out_c0_exe29198(GPOUT,77)
    out_c0_exe29198 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe29198;

    -- out_c0_exe30199(GPOUT,78)
    out_c0_exe30199 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe30199;

    -- out_c0_exe31200(GPOUT,79)
    out_c0_exe31200 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe31200;

    -- out_c0_exe3172(GPOUT,80)
    out_c0_exe3172 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe3172;

    -- out_c0_exe32201(GPOUT,81)
    out_c0_exe32201 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe32201;

    -- out_c0_exe33202(GPOUT,82)
    out_c0_exe33202 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe33202;

    -- out_c0_exe34203(GPOUT,83)
    out_c0_exe34203 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe34203;

    -- out_c0_exe35204(GPOUT,84)
    out_c0_exe35204 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe35204;

    -- out_c0_exe36205(GPOUT,85)
    out_c0_exe36205 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe36205;

    -- out_c0_exe37206(GPOUT,86)
    out_c0_exe37206 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe37206;

    -- out_c0_exe38207(GPOUT,87)
    out_c0_exe38207 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe38207;

    -- out_c0_exe39208(GPOUT,88)
    out_c0_exe39208 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe39208;

    -- out_c0_exe40209(GPOUT,89)
    out_c0_exe40209 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe40209;

    -- out_c0_exe41210(GPOUT,90)
    out_c0_exe41210 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe41210;

    -- out_c0_exe4173(GPOUT,91)
    out_c0_exe4173 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe4173;

    -- out_c0_exe42211(GPOUT,92)
    out_c0_exe42211 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe42211;

    -- out_c0_exe43212(GPOUT,93)
    out_c0_exe43212 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe43212;

    -- out_c0_exe44213(GPOUT,94)
    out_c0_exe44213 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe44213;

    -- out_c0_exe45214(GPOUT,95)
    out_c0_exe45214 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe45214;

    -- out_c0_exe46215(GPOUT,96)
    out_c0_exe46215 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe46215;

    -- out_c0_exe47216(GPOUT,97)
    out_c0_exe47216 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe47216;

    -- out_c0_exe48217(GPOUT,98)
    out_c0_exe48217 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe48217;

    -- out_c0_exe49218(GPOUT,99)
    out_c0_exe49218 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe49218;

    -- out_c0_exe50219(GPOUT,100)
    out_c0_exe50219 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe50219;

    -- out_c0_exe5174(GPOUT,101)
    out_c0_exe5174 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe5174;

    -- out_c0_exe6175(GPOUT,102)
    out_c0_exe6175 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe6175;

    -- out_c0_exe7176(GPOUT,103)
    out_c0_exe7176 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe7176;

    -- out_c0_exe8177(GPOUT,104)
    out_c0_exe8177 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe8177;

    -- out_c0_exe9178(GPOUT,105)
    out_c0_exe9178 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_c0_exe9178;

    -- out_dag_node_pm_2(GPOUT,106)
    out_dag_node_pm_2 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_dag_node_pm_2;

    -- out_stall_out_0(GPOUT,107)
    out_stall_out_0 <= ethash_calculate_dag_item_B5_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,108)
    out_stall_out_1 <= ethash_calculate_dag_item_B5_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,109)
    out_valid_out_0 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,110)
    out_valid_out_1 <= ethash_calculate_dag_item_B5_branch_aunroll_x_out_valid_out_1;

END normal;
