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

-- VHDL created from ethash_calculate_dag_item_B5_merge
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

entity ethash_calculate_dag_item_B5_merge is
    port (
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe111 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11219 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe21324 : out std_logic_vector(0 downto 0);  -- ufix1
        out_dag_node_pm_2 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_r_0_i_i11_ph : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01650 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01652 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01654 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01656 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01658 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01660 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01662 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01664 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01666 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01668 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01670 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01672 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01674 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01676 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01678 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01680 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01682 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01684 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01686 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01688 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01690 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01692 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01694 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11651 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11653 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11655 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11657 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11659 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11661 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11663 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11665 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11667 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11669 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11671 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11673 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11675 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11677 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11679 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11681 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11683 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11685 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11687 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11689 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11691 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11693 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11695 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B5_merge;

architecture normal of ethash_calculate_dag_item_B5_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id39_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id39_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe111_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe111_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11219_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11219_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe21324_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe21324_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dag_node_pm_2_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal dag_node_pm_2_mux_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal r_0_i_i11_ph_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_0_i_i11_ph_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01650_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01650_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01652_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01652_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01654_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01654_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01656_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01656_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01658_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01658_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01660_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01660_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01662_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01662_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01664_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01664_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01666_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01666_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01668_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01668_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01670_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01670_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01672_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01672_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01674_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01674_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01676_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01676_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01678_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01678_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01680_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01680_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01682_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01682_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01684_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01684_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01686_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01686_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01688_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01688_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01690_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01690_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01692_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01692_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01694_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01694_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11651_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11651_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11653_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11653_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11655_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11655_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11657_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11657_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11659_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11659_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11661_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11661_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11663_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11663_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11665_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11665_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11667_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11667_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11669_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11669_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11671_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11671_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11673_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11673_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11675_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11675_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11677_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11677_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11679_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11679_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11681_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11681_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11683_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11683_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11685_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11685_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11687_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11687_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11689_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11689_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11691_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11691_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11693_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11693_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11695_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11695_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- acl_hw_wg_id39_mux(MUX,2)
    acl_hw_wg_id39_mux_s <= in_valid_in_0;
    acl_hw_wg_id39_mux_combproc: PROCESS (acl_hw_wg_id39_mux_s, in_acl_hw_wg_id39_1, in_acl_hw_wg_id39_0)
    BEGIN
        CASE (acl_hw_wg_id39_mux_s) IS
            WHEN "0" => acl_hw_wg_id39_mux_q <= in_acl_hw_wg_id39_1;
            WHEN "1" => acl_hw_wg_id39_mux_q <= in_acl_hw_wg_id39_0;
            WHEN OTHERS => acl_hw_wg_id39_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_acl_hw_wg_id39(GPOUT,114)
    out_acl_hw_wg_id39 <= acl_hw_wg_id39_mux_q;

    -- c0_exe111_mux(MUX,3)
    c0_exe111_mux_s <= in_valid_in_0;
    c0_exe111_mux_combproc: PROCESS (c0_exe111_mux_s, in_c0_exe111_1, in_c0_exe111_0)
    BEGIN
        CASE (c0_exe111_mux_s) IS
            WHEN "0" => c0_exe111_mux_q <= in_c0_exe111_1;
            WHEN "1" => c0_exe111_mux_q <= in_c0_exe111_0;
            WHEN OTHERS => c0_exe111_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe111(GPOUT,115)
    out_c0_exe111 <= c0_exe111_mux_q;

    -- c0_exe11219_mux(MUX,4)
    c0_exe11219_mux_s <= in_valid_in_0;
    c0_exe11219_mux_combproc: PROCESS (c0_exe11219_mux_s, in_c0_exe11219_1, in_c0_exe11219_0)
    BEGIN
        CASE (c0_exe11219_mux_s) IS
            WHEN "0" => c0_exe11219_mux_q <= in_c0_exe11219_1;
            WHEN "1" => c0_exe11219_mux_q <= in_c0_exe11219_0;
            WHEN OTHERS => c0_exe11219_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe11219(GPOUT,116)
    out_c0_exe11219 <= c0_exe11219_mux_q;

    -- c0_exe21324_mux(MUX,5)
    c0_exe21324_mux_s <= in_valid_in_0;
    c0_exe21324_mux_combproc: PROCESS (c0_exe21324_mux_s, in_c0_exe21324_1, in_c0_exe21324_0)
    BEGIN
        CASE (c0_exe21324_mux_s) IS
            WHEN "0" => c0_exe21324_mux_q <= in_c0_exe21324_1;
            WHEN "1" => c0_exe21324_mux_q <= in_c0_exe21324_0;
            WHEN OTHERS => c0_exe21324_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe21324(GPOUT,117)
    out_c0_exe21324 <= c0_exe21324_mux_q;

    -- dag_node_pm_2_mux(MUX,6)
    dag_node_pm_2_mux_s <= in_valid_in_0;
    dag_node_pm_2_mux_combproc: PROCESS (dag_node_pm_2_mux_s, in_dag_node_pm_2_1, in_dag_node_pm_2_0)
    BEGIN
        CASE (dag_node_pm_2_mux_s) IS
            WHEN "0" => dag_node_pm_2_mux_q <= in_dag_node_pm_2_1;
            WHEN "1" => dag_node_pm_2_mux_q <= in_dag_node_pm_2_0;
            WHEN OTHERS => dag_node_pm_2_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_dag_node_pm_2(GPOUT,118)
    out_dag_node_pm_2 <= dag_node_pm_2_mux_q;

    -- r_0_i_i11_ph_mux(MUX,169)
    r_0_i_i11_ph_mux_s <= in_valid_in_0;
    r_0_i_i11_ph_mux_combproc: PROCESS (r_0_i_i11_ph_mux_s, in_r_0_i_i11_ph_1, in_r_0_i_i11_ph_0)
    BEGIN
        CASE (r_0_i_i11_ph_mux_s) IS
            WHEN "0" => r_0_i_i11_ph_mux_q <= in_r_0_i_i11_ph_1;
            WHEN "1" => r_0_i_i11_ph_mux_q <= in_r_0_i_i11_ph_0;
            WHEN OTHERS => r_0_i_i11_ph_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_r_0_i_i11_ph(GPOUT,119)
    out_r_0_i_i11_ph <= r_0_i_i11_ph_mux_q;

    -- scalarizer_01650_mux(MUX,170)
    scalarizer_01650_mux_s <= in_valid_in_0;
    scalarizer_01650_mux_combproc: PROCESS (scalarizer_01650_mux_s, in_scalarizer_01650_1, in_scalarizer_01650_0)
    BEGIN
        CASE (scalarizer_01650_mux_s) IS
            WHEN "0" => scalarizer_01650_mux_q <= in_scalarizer_01650_1;
            WHEN "1" => scalarizer_01650_mux_q <= in_scalarizer_01650_0;
            WHEN OTHERS => scalarizer_01650_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01650(GPOUT,120)
    out_scalarizer_01650 <= scalarizer_01650_mux_q;

    -- scalarizer_01652_mux(MUX,171)
    scalarizer_01652_mux_s <= in_valid_in_0;
    scalarizer_01652_mux_combproc: PROCESS (scalarizer_01652_mux_s, in_scalarizer_01652_1, in_scalarizer_01652_0)
    BEGIN
        CASE (scalarizer_01652_mux_s) IS
            WHEN "0" => scalarizer_01652_mux_q <= in_scalarizer_01652_1;
            WHEN "1" => scalarizer_01652_mux_q <= in_scalarizer_01652_0;
            WHEN OTHERS => scalarizer_01652_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01652(GPOUT,121)
    out_scalarizer_01652 <= scalarizer_01652_mux_q;

    -- scalarizer_01654_mux(MUX,172)
    scalarizer_01654_mux_s <= in_valid_in_0;
    scalarizer_01654_mux_combproc: PROCESS (scalarizer_01654_mux_s, in_scalarizer_01654_1, in_scalarizer_01654_0)
    BEGIN
        CASE (scalarizer_01654_mux_s) IS
            WHEN "0" => scalarizer_01654_mux_q <= in_scalarizer_01654_1;
            WHEN "1" => scalarizer_01654_mux_q <= in_scalarizer_01654_0;
            WHEN OTHERS => scalarizer_01654_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01654(GPOUT,122)
    out_scalarizer_01654 <= scalarizer_01654_mux_q;

    -- scalarizer_01656_mux(MUX,173)
    scalarizer_01656_mux_s <= in_valid_in_0;
    scalarizer_01656_mux_combproc: PROCESS (scalarizer_01656_mux_s, in_scalarizer_01656_1, in_scalarizer_01656_0)
    BEGIN
        CASE (scalarizer_01656_mux_s) IS
            WHEN "0" => scalarizer_01656_mux_q <= in_scalarizer_01656_1;
            WHEN "1" => scalarizer_01656_mux_q <= in_scalarizer_01656_0;
            WHEN OTHERS => scalarizer_01656_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01656(GPOUT,123)
    out_scalarizer_01656 <= scalarizer_01656_mux_q;

    -- scalarizer_01658_mux(MUX,174)
    scalarizer_01658_mux_s <= in_valid_in_0;
    scalarizer_01658_mux_combproc: PROCESS (scalarizer_01658_mux_s, in_scalarizer_01658_1, in_scalarizer_01658_0)
    BEGIN
        CASE (scalarizer_01658_mux_s) IS
            WHEN "0" => scalarizer_01658_mux_q <= in_scalarizer_01658_1;
            WHEN "1" => scalarizer_01658_mux_q <= in_scalarizer_01658_0;
            WHEN OTHERS => scalarizer_01658_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01658(GPOUT,124)
    out_scalarizer_01658 <= scalarizer_01658_mux_q;

    -- scalarizer_01660_mux(MUX,175)
    scalarizer_01660_mux_s <= in_valid_in_0;
    scalarizer_01660_mux_combproc: PROCESS (scalarizer_01660_mux_s, in_scalarizer_01660_1, in_scalarizer_01660_0)
    BEGIN
        CASE (scalarizer_01660_mux_s) IS
            WHEN "0" => scalarizer_01660_mux_q <= in_scalarizer_01660_1;
            WHEN "1" => scalarizer_01660_mux_q <= in_scalarizer_01660_0;
            WHEN OTHERS => scalarizer_01660_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01660(GPOUT,125)
    out_scalarizer_01660 <= scalarizer_01660_mux_q;

    -- scalarizer_01662_mux(MUX,176)
    scalarizer_01662_mux_s <= in_valid_in_0;
    scalarizer_01662_mux_combproc: PROCESS (scalarizer_01662_mux_s, in_scalarizer_01662_1, in_scalarizer_01662_0)
    BEGIN
        CASE (scalarizer_01662_mux_s) IS
            WHEN "0" => scalarizer_01662_mux_q <= in_scalarizer_01662_1;
            WHEN "1" => scalarizer_01662_mux_q <= in_scalarizer_01662_0;
            WHEN OTHERS => scalarizer_01662_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01662(GPOUT,126)
    out_scalarizer_01662 <= scalarizer_01662_mux_q;

    -- scalarizer_01664_mux(MUX,177)
    scalarizer_01664_mux_s <= in_valid_in_0;
    scalarizer_01664_mux_combproc: PROCESS (scalarizer_01664_mux_s, in_scalarizer_01664_1, in_scalarizer_01664_0)
    BEGIN
        CASE (scalarizer_01664_mux_s) IS
            WHEN "0" => scalarizer_01664_mux_q <= in_scalarizer_01664_1;
            WHEN "1" => scalarizer_01664_mux_q <= in_scalarizer_01664_0;
            WHEN OTHERS => scalarizer_01664_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01664(GPOUT,127)
    out_scalarizer_01664 <= scalarizer_01664_mux_q;

    -- scalarizer_01666_mux(MUX,178)
    scalarizer_01666_mux_s <= in_valid_in_0;
    scalarizer_01666_mux_combproc: PROCESS (scalarizer_01666_mux_s, in_scalarizer_01666_1, in_scalarizer_01666_0)
    BEGIN
        CASE (scalarizer_01666_mux_s) IS
            WHEN "0" => scalarizer_01666_mux_q <= in_scalarizer_01666_1;
            WHEN "1" => scalarizer_01666_mux_q <= in_scalarizer_01666_0;
            WHEN OTHERS => scalarizer_01666_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01666(GPOUT,128)
    out_scalarizer_01666 <= scalarizer_01666_mux_q;

    -- scalarizer_01668_mux(MUX,179)
    scalarizer_01668_mux_s <= in_valid_in_0;
    scalarizer_01668_mux_combproc: PROCESS (scalarizer_01668_mux_s, in_scalarizer_01668_1, in_scalarizer_01668_0)
    BEGIN
        CASE (scalarizer_01668_mux_s) IS
            WHEN "0" => scalarizer_01668_mux_q <= in_scalarizer_01668_1;
            WHEN "1" => scalarizer_01668_mux_q <= in_scalarizer_01668_0;
            WHEN OTHERS => scalarizer_01668_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01668(GPOUT,129)
    out_scalarizer_01668 <= scalarizer_01668_mux_q;

    -- scalarizer_01670_mux(MUX,180)
    scalarizer_01670_mux_s <= in_valid_in_0;
    scalarizer_01670_mux_combproc: PROCESS (scalarizer_01670_mux_s, in_scalarizer_01670_1, in_scalarizer_01670_0)
    BEGIN
        CASE (scalarizer_01670_mux_s) IS
            WHEN "0" => scalarizer_01670_mux_q <= in_scalarizer_01670_1;
            WHEN "1" => scalarizer_01670_mux_q <= in_scalarizer_01670_0;
            WHEN OTHERS => scalarizer_01670_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01670(GPOUT,130)
    out_scalarizer_01670 <= scalarizer_01670_mux_q;

    -- scalarizer_01672_mux(MUX,181)
    scalarizer_01672_mux_s <= in_valid_in_0;
    scalarizer_01672_mux_combproc: PROCESS (scalarizer_01672_mux_s, in_scalarizer_01672_1, in_scalarizer_01672_0)
    BEGIN
        CASE (scalarizer_01672_mux_s) IS
            WHEN "0" => scalarizer_01672_mux_q <= in_scalarizer_01672_1;
            WHEN "1" => scalarizer_01672_mux_q <= in_scalarizer_01672_0;
            WHEN OTHERS => scalarizer_01672_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01672(GPOUT,131)
    out_scalarizer_01672 <= scalarizer_01672_mux_q;

    -- scalarizer_01674_mux(MUX,182)
    scalarizer_01674_mux_s <= in_valid_in_0;
    scalarizer_01674_mux_combproc: PROCESS (scalarizer_01674_mux_s, in_scalarizer_01674_1, in_scalarizer_01674_0)
    BEGIN
        CASE (scalarizer_01674_mux_s) IS
            WHEN "0" => scalarizer_01674_mux_q <= in_scalarizer_01674_1;
            WHEN "1" => scalarizer_01674_mux_q <= in_scalarizer_01674_0;
            WHEN OTHERS => scalarizer_01674_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01674(GPOUT,132)
    out_scalarizer_01674 <= scalarizer_01674_mux_q;

    -- scalarizer_01676_mux(MUX,183)
    scalarizer_01676_mux_s <= in_valid_in_0;
    scalarizer_01676_mux_combproc: PROCESS (scalarizer_01676_mux_s, in_scalarizer_01676_1, in_scalarizer_01676_0)
    BEGIN
        CASE (scalarizer_01676_mux_s) IS
            WHEN "0" => scalarizer_01676_mux_q <= in_scalarizer_01676_1;
            WHEN "1" => scalarizer_01676_mux_q <= in_scalarizer_01676_0;
            WHEN OTHERS => scalarizer_01676_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01676(GPOUT,133)
    out_scalarizer_01676 <= scalarizer_01676_mux_q;

    -- scalarizer_01678_mux(MUX,184)
    scalarizer_01678_mux_s <= in_valid_in_0;
    scalarizer_01678_mux_combproc: PROCESS (scalarizer_01678_mux_s, in_scalarizer_01678_1, in_scalarizer_01678_0)
    BEGIN
        CASE (scalarizer_01678_mux_s) IS
            WHEN "0" => scalarizer_01678_mux_q <= in_scalarizer_01678_1;
            WHEN "1" => scalarizer_01678_mux_q <= in_scalarizer_01678_0;
            WHEN OTHERS => scalarizer_01678_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01678(GPOUT,134)
    out_scalarizer_01678 <= scalarizer_01678_mux_q;

    -- scalarizer_01680_mux(MUX,185)
    scalarizer_01680_mux_s <= in_valid_in_0;
    scalarizer_01680_mux_combproc: PROCESS (scalarizer_01680_mux_s, in_scalarizer_01680_1, in_scalarizer_01680_0)
    BEGIN
        CASE (scalarizer_01680_mux_s) IS
            WHEN "0" => scalarizer_01680_mux_q <= in_scalarizer_01680_1;
            WHEN "1" => scalarizer_01680_mux_q <= in_scalarizer_01680_0;
            WHEN OTHERS => scalarizer_01680_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01680(GPOUT,135)
    out_scalarizer_01680 <= scalarizer_01680_mux_q;

    -- scalarizer_01682_mux(MUX,186)
    scalarizer_01682_mux_s <= in_valid_in_0;
    scalarizer_01682_mux_combproc: PROCESS (scalarizer_01682_mux_s, in_scalarizer_01682_1, in_scalarizer_01682_0)
    BEGIN
        CASE (scalarizer_01682_mux_s) IS
            WHEN "0" => scalarizer_01682_mux_q <= in_scalarizer_01682_1;
            WHEN "1" => scalarizer_01682_mux_q <= in_scalarizer_01682_0;
            WHEN OTHERS => scalarizer_01682_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01682(GPOUT,136)
    out_scalarizer_01682 <= scalarizer_01682_mux_q;

    -- scalarizer_01684_mux(MUX,187)
    scalarizer_01684_mux_s <= in_valid_in_0;
    scalarizer_01684_mux_combproc: PROCESS (scalarizer_01684_mux_s, in_scalarizer_01684_1, in_scalarizer_01684_0)
    BEGIN
        CASE (scalarizer_01684_mux_s) IS
            WHEN "0" => scalarizer_01684_mux_q <= in_scalarizer_01684_1;
            WHEN "1" => scalarizer_01684_mux_q <= in_scalarizer_01684_0;
            WHEN OTHERS => scalarizer_01684_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01684(GPOUT,137)
    out_scalarizer_01684 <= scalarizer_01684_mux_q;

    -- scalarizer_01686_mux(MUX,188)
    scalarizer_01686_mux_s <= in_valid_in_0;
    scalarizer_01686_mux_combproc: PROCESS (scalarizer_01686_mux_s, in_scalarizer_01686_1, in_scalarizer_01686_0)
    BEGIN
        CASE (scalarizer_01686_mux_s) IS
            WHEN "0" => scalarizer_01686_mux_q <= in_scalarizer_01686_1;
            WHEN "1" => scalarizer_01686_mux_q <= in_scalarizer_01686_0;
            WHEN OTHERS => scalarizer_01686_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01686(GPOUT,138)
    out_scalarizer_01686 <= scalarizer_01686_mux_q;

    -- scalarizer_01688_mux(MUX,189)
    scalarizer_01688_mux_s <= in_valid_in_0;
    scalarizer_01688_mux_combproc: PROCESS (scalarizer_01688_mux_s, in_scalarizer_01688_1, in_scalarizer_01688_0)
    BEGIN
        CASE (scalarizer_01688_mux_s) IS
            WHEN "0" => scalarizer_01688_mux_q <= in_scalarizer_01688_1;
            WHEN "1" => scalarizer_01688_mux_q <= in_scalarizer_01688_0;
            WHEN OTHERS => scalarizer_01688_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01688(GPOUT,139)
    out_scalarizer_01688 <= scalarizer_01688_mux_q;

    -- scalarizer_01690_mux(MUX,190)
    scalarizer_01690_mux_s <= in_valid_in_0;
    scalarizer_01690_mux_combproc: PROCESS (scalarizer_01690_mux_s, in_scalarizer_01690_1, in_scalarizer_01690_0)
    BEGIN
        CASE (scalarizer_01690_mux_s) IS
            WHEN "0" => scalarizer_01690_mux_q <= in_scalarizer_01690_1;
            WHEN "1" => scalarizer_01690_mux_q <= in_scalarizer_01690_0;
            WHEN OTHERS => scalarizer_01690_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01690(GPOUT,140)
    out_scalarizer_01690 <= scalarizer_01690_mux_q;

    -- scalarizer_01692_mux(MUX,191)
    scalarizer_01692_mux_s <= in_valid_in_0;
    scalarizer_01692_mux_combproc: PROCESS (scalarizer_01692_mux_s, in_scalarizer_01692_1, in_scalarizer_01692_0)
    BEGIN
        CASE (scalarizer_01692_mux_s) IS
            WHEN "0" => scalarizer_01692_mux_q <= in_scalarizer_01692_1;
            WHEN "1" => scalarizer_01692_mux_q <= in_scalarizer_01692_0;
            WHEN OTHERS => scalarizer_01692_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01692(GPOUT,141)
    out_scalarizer_01692 <= scalarizer_01692_mux_q;

    -- scalarizer_01694_mux(MUX,192)
    scalarizer_01694_mux_s <= in_valid_in_0;
    scalarizer_01694_mux_combproc: PROCESS (scalarizer_01694_mux_s, in_scalarizer_01694_1, in_scalarizer_01694_0)
    BEGIN
        CASE (scalarizer_01694_mux_s) IS
            WHEN "0" => scalarizer_01694_mux_q <= in_scalarizer_01694_1;
            WHEN "1" => scalarizer_01694_mux_q <= in_scalarizer_01694_0;
            WHEN OTHERS => scalarizer_01694_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01694(GPOUT,142)
    out_scalarizer_01694 <= scalarizer_01694_mux_q;

    -- scalarizer_11651_mux(MUX,193)
    scalarizer_11651_mux_s <= in_valid_in_0;
    scalarizer_11651_mux_combproc: PROCESS (scalarizer_11651_mux_s, in_scalarizer_11651_1, in_scalarizer_11651_0)
    BEGIN
        CASE (scalarizer_11651_mux_s) IS
            WHEN "0" => scalarizer_11651_mux_q <= in_scalarizer_11651_1;
            WHEN "1" => scalarizer_11651_mux_q <= in_scalarizer_11651_0;
            WHEN OTHERS => scalarizer_11651_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11651(GPOUT,143)
    out_scalarizer_11651 <= scalarizer_11651_mux_q;

    -- scalarizer_11653_mux(MUX,194)
    scalarizer_11653_mux_s <= in_valid_in_0;
    scalarizer_11653_mux_combproc: PROCESS (scalarizer_11653_mux_s, in_scalarizer_11653_1, in_scalarizer_11653_0)
    BEGIN
        CASE (scalarizer_11653_mux_s) IS
            WHEN "0" => scalarizer_11653_mux_q <= in_scalarizer_11653_1;
            WHEN "1" => scalarizer_11653_mux_q <= in_scalarizer_11653_0;
            WHEN OTHERS => scalarizer_11653_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11653(GPOUT,144)
    out_scalarizer_11653 <= scalarizer_11653_mux_q;

    -- scalarizer_11655_mux(MUX,195)
    scalarizer_11655_mux_s <= in_valid_in_0;
    scalarizer_11655_mux_combproc: PROCESS (scalarizer_11655_mux_s, in_scalarizer_11655_1, in_scalarizer_11655_0)
    BEGIN
        CASE (scalarizer_11655_mux_s) IS
            WHEN "0" => scalarizer_11655_mux_q <= in_scalarizer_11655_1;
            WHEN "1" => scalarizer_11655_mux_q <= in_scalarizer_11655_0;
            WHEN OTHERS => scalarizer_11655_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11655(GPOUT,145)
    out_scalarizer_11655 <= scalarizer_11655_mux_q;

    -- scalarizer_11657_mux(MUX,196)
    scalarizer_11657_mux_s <= in_valid_in_0;
    scalarizer_11657_mux_combproc: PROCESS (scalarizer_11657_mux_s, in_scalarizer_11657_1, in_scalarizer_11657_0)
    BEGIN
        CASE (scalarizer_11657_mux_s) IS
            WHEN "0" => scalarizer_11657_mux_q <= in_scalarizer_11657_1;
            WHEN "1" => scalarizer_11657_mux_q <= in_scalarizer_11657_0;
            WHEN OTHERS => scalarizer_11657_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11657(GPOUT,146)
    out_scalarizer_11657 <= scalarizer_11657_mux_q;

    -- scalarizer_11659_mux(MUX,197)
    scalarizer_11659_mux_s <= in_valid_in_0;
    scalarizer_11659_mux_combproc: PROCESS (scalarizer_11659_mux_s, in_scalarizer_11659_1, in_scalarizer_11659_0)
    BEGIN
        CASE (scalarizer_11659_mux_s) IS
            WHEN "0" => scalarizer_11659_mux_q <= in_scalarizer_11659_1;
            WHEN "1" => scalarizer_11659_mux_q <= in_scalarizer_11659_0;
            WHEN OTHERS => scalarizer_11659_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11659(GPOUT,147)
    out_scalarizer_11659 <= scalarizer_11659_mux_q;

    -- scalarizer_11661_mux(MUX,198)
    scalarizer_11661_mux_s <= in_valid_in_0;
    scalarizer_11661_mux_combproc: PROCESS (scalarizer_11661_mux_s, in_scalarizer_11661_1, in_scalarizer_11661_0)
    BEGIN
        CASE (scalarizer_11661_mux_s) IS
            WHEN "0" => scalarizer_11661_mux_q <= in_scalarizer_11661_1;
            WHEN "1" => scalarizer_11661_mux_q <= in_scalarizer_11661_0;
            WHEN OTHERS => scalarizer_11661_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11661(GPOUT,148)
    out_scalarizer_11661 <= scalarizer_11661_mux_q;

    -- scalarizer_11663_mux(MUX,199)
    scalarizer_11663_mux_s <= in_valid_in_0;
    scalarizer_11663_mux_combproc: PROCESS (scalarizer_11663_mux_s, in_scalarizer_11663_1, in_scalarizer_11663_0)
    BEGIN
        CASE (scalarizer_11663_mux_s) IS
            WHEN "0" => scalarizer_11663_mux_q <= in_scalarizer_11663_1;
            WHEN "1" => scalarizer_11663_mux_q <= in_scalarizer_11663_0;
            WHEN OTHERS => scalarizer_11663_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11663(GPOUT,149)
    out_scalarizer_11663 <= scalarizer_11663_mux_q;

    -- scalarizer_11665_mux(MUX,200)
    scalarizer_11665_mux_s <= in_valid_in_0;
    scalarizer_11665_mux_combproc: PROCESS (scalarizer_11665_mux_s, in_scalarizer_11665_1, in_scalarizer_11665_0)
    BEGIN
        CASE (scalarizer_11665_mux_s) IS
            WHEN "0" => scalarizer_11665_mux_q <= in_scalarizer_11665_1;
            WHEN "1" => scalarizer_11665_mux_q <= in_scalarizer_11665_0;
            WHEN OTHERS => scalarizer_11665_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11665(GPOUT,150)
    out_scalarizer_11665 <= scalarizer_11665_mux_q;

    -- scalarizer_11667_mux(MUX,201)
    scalarizer_11667_mux_s <= in_valid_in_0;
    scalarizer_11667_mux_combproc: PROCESS (scalarizer_11667_mux_s, in_scalarizer_11667_1, in_scalarizer_11667_0)
    BEGIN
        CASE (scalarizer_11667_mux_s) IS
            WHEN "0" => scalarizer_11667_mux_q <= in_scalarizer_11667_1;
            WHEN "1" => scalarizer_11667_mux_q <= in_scalarizer_11667_0;
            WHEN OTHERS => scalarizer_11667_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11667(GPOUT,151)
    out_scalarizer_11667 <= scalarizer_11667_mux_q;

    -- scalarizer_11669_mux(MUX,202)
    scalarizer_11669_mux_s <= in_valid_in_0;
    scalarizer_11669_mux_combproc: PROCESS (scalarizer_11669_mux_s, in_scalarizer_11669_1, in_scalarizer_11669_0)
    BEGIN
        CASE (scalarizer_11669_mux_s) IS
            WHEN "0" => scalarizer_11669_mux_q <= in_scalarizer_11669_1;
            WHEN "1" => scalarizer_11669_mux_q <= in_scalarizer_11669_0;
            WHEN OTHERS => scalarizer_11669_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11669(GPOUT,152)
    out_scalarizer_11669 <= scalarizer_11669_mux_q;

    -- scalarizer_11671_mux(MUX,203)
    scalarizer_11671_mux_s <= in_valid_in_0;
    scalarizer_11671_mux_combproc: PROCESS (scalarizer_11671_mux_s, in_scalarizer_11671_1, in_scalarizer_11671_0)
    BEGIN
        CASE (scalarizer_11671_mux_s) IS
            WHEN "0" => scalarizer_11671_mux_q <= in_scalarizer_11671_1;
            WHEN "1" => scalarizer_11671_mux_q <= in_scalarizer_11671_0;
            WHEN OTHERS => scalarizer_11671_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11671(GPOUT,153)
    out_scalarizer_11671 <= scalarizer_11671_mux_q;

    -- scalarizer_11673_mux(MUX,204)
    scalarizer_11673_mux_s <= in_valid_in_0;
    scalarizer_11673_mux_combproc: PROCESS (scalarizer_11673_mux_s, in_scalarizer_11673_1, in_scalarizer_11673_0)
    BEGIN
        CASE (scalarizer_11673_mux_s) IS
            WHEN "0" => scalarizer_11673_mux_q <= in_scalarizer_11673_1;
            WHEN "1" => scalarizer_11673_mux_q <= in_scalarizer_11673_0;
            WHEN OTHERS => scalarizer_11673_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11673(GPOUT,154)
    out_scalarizer_11673 <= scalarizer_11673_mux_q;

    -- scalarizer_11675_mux(MUX,205)
    scalarizer_11675_mux_s <= in_valid_in_0;
    scalarizer_11675_mux_combproc: PROCESS (scalarizer_11675_mux_s, in_scalarizer_11675_1, in_scalarizer_11675_0)
    BEGIN
        CASE (scalarizer_11675_mux_s) IS
            WHEN "0" => scalarizer_11675_mux_q <= in_scalarizer_11675_1;
            WHEN "1" => scalarizer_11675_mux_q <= in_scalarizer_11675_0;
            WHEN OTHERS => scalarizer_11675_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11675(GPOUT,155)
    out_scalarizer_11675 <= scalarizer_11675_mux_q;

    -- scalarizer_11677_mux(MUX,206)
    scalarizer_11677_mux_s <= in_valid_in_0;
    scalarizer_11677_mux_combproc: PROCESS (scalarizer_11677_mux_s, in_scalarizer_11677_1, in_scalarizer_11677_0)
    BEGIN
        CASE (scalarizer_11677_mux_s) IS
            WHEN "0" => scalarizer_11677_mux_q <= in_scalarizer_11677_1;
            WHEN "1" => scalarizer_11677_mux_q <= in_scalarizer_11677_0;
            WHEN OTHERS => scalarizer_11677_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11677(GPOUT,156)
    out_scalarizer_11677 <= scalarizer_11677_mux_q;

    -- scalarizer_11679_mux(MUX,207)
    scalarizer_11679_mux_s <= in_valid_in_0;
    scalarizer_11679_mux_combproc: PROCESS (scalarizer_11679_mux_s, in_scalarizer_11679_1, in_scalarizer_11679_0)
    BEGIN
        CASE (scalarizer_11679_mux_s) IS
            WHEN "0" => scalarizer_11679_mux_q <= in_scalarizer_11679_1;
            WHEN "1" => scalarizer_11679_mux_q <= in_scalarizer_11679_0;
            WHEN OTHERS => scalarizer_11679_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11679(GPOUT,157)
    out_scalarizer_11679 <= scalarizer_11679_mux_q;

    -- scalarizer_11681_mux(MUX,208)
    scalarizer_11681_mux_s <= in_valid_in_0;
    scalarizer_11681_mux_combproc: PROCESS (scalarizer_11681_mux_s, in_scalarizer_11681_1, in_scalarizer_11681_0)
    BEGIN
        CASE (scalarizer_11681_mux_s) IS
            WHEN "0" => scalarizer_11681_mux_q <= in_scalarizer_11681_1;
            WHEN "1" => scalarizer_11681_mux_q <= in_scalarizer_11681_0;
            WHEN OTHERS => scalarizer_11681_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11681(GPOUT,158)
    out_scalarizer_11681 <= scalarizer_11681_mux_q;

    -- scalarizer_11683_mux(MUX,209)
    scalarizer_11683_mux_s <= in_valid_in_0;
    scalarizer_11683_mux_combproc: PROCESS (scalarizer_11683_mux_s, in_scalarizer_11683_1, in_scalarizer_11683_0)
    BEGIN
        CASE (scalarizer_11683_mux_s) IS
            WHEN "0" => scalarizer_11683_mux_q <= in_scalarizer_11683_1;
            WHEN "1" => scalarizer_11683_mux_q <= in_scalarizer_11683_0;
            WHEN OTHERS => scalarizer_11683_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11683(GPOUT,159)
    out_scalarizer_11683 <= scalarizer_11683_mux_q;

    -- scalarizer_11685_mux(MUX,210)
    scalarizer_11685_mux_s <= in_valid_in_0;
    scalarizer_11685_mux_combproc: PROCESS (scalarizer_11685_mux_s, in_scalarizer_11685_1, in_scalarizer_11685_0)
    BEGIN
        CASE (scalarizer_11685_mux_s) IS
            WHEN "0" => scalarizer_11685_mux_q <= in_scalarizer_11685_1;
            WHEN "1" => scalarizer_11685_mux_q <= in_scalarizer_11685_0;
            WHEN OTHERS => scalarizer_11685_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11685(GPOUT,160)
    out_scalarizer_11685 <= scalarizer_11685_mux_q;

    -- scalarizer_11687_mux(MUX,211)
    scalarizer_11687_mux_s <= in_valid_in_0;
    scalarizer_11687_mux_combproc: PROCESS (scalarizer_11687_mux_s, in_scalarizer_11687_1, in_scalarizer_11687_0)
    BEGIN
        CASE (scalarizer_11687_mux_s) IS
            WHEN "0" => scalarizer_11687_mux_q <= in_scalarizer_11687_1;
            WHEN "1" => scalarizer_11687_mux_q <= in_scalarizer_11687_0;
            WHEN OTHERS => scalarizer_11687_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11687(GPOUT,161)
    out_scalarizer_11687 <= scalarizer_11687_mux_q;

    -- scalarizer_11689_mux(MUX,212)
    scalarizer_11689_mux_s <= in_valid_in_0;
    scalarizer_11689_mux_combproc: PROCESS (scalarizer_11689_mux_s, in_scalarizer_11689_1, in_scalarizer_11689_0)
    BEGIN
        CASE (scalarizer_11689_mux_s) IS
            WHEN "0" => scalarizer_11689_mux_q <= in_scalarizer_11689_1;
            WHEN "1" => scalarizer_11689_mux_q <= in_scalarizer_11689_0;
            WHEN OTHERS => scalarizer_11689_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11689(GPOUT,162)
    out_scalarizer_11689 <= scalarizer_11689_mux_q;

    -- scalarizer_11691_mux(MUX,213)
    scalarizer_11691_mux_s <= in_valid_in_0;
    scalarizer_11691_mux_combproc: PROCESS (scalarizer_11691_mux_s, in_scalarizer_11691_1, in_scalarizer_11691_0)
    BEGIN
        CASE (scalarizer_11691_mux_s) IS
            WHEN "0" => scalarizer_11691_mux_q <= in_scalarizer_11691_1;
            WHEN "1" => scalarizer_11691_mux_q <= in_scalarizer_11691_0;
            WHEN OTHERS => scalarizer_11691_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11691(GPOUT,163)
    out_scalarizer_11691 <= scalarizer_11691_mux_q;

    -- scalarizer_11693_mux(MUX,214)
    scalarizer_11693_mux_s <= in_valid_in_0;
    scalarizer_11693_mux_combproc: PROCESS (scalarizer_11693_mux_s, in_scalarizer_11693_1, in_scalarizer_11693_0)
    BEGIN
        CASE (scalarizer_11693_mux_s) IS
            WHEN "0" => scalarizer_11693_mux_q <= in_scalarizer_11693_1;
            WHEN "1" => scalarizer_11693_mux_q <= in_scalarizer_11693_0;
            WHEN OTHERS => scalarizer_11693_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11693(GPOUT,164)
    out_scalarizer_11693 <= scalarizer_11693_mux_q;

    -- scalarizer_11695_mux(MUX,215)
    scalarizer_11695_mux_s <= in_valid_in_0;
    scalarizer_11695_mux_combproc: PROCESS (scalarizer_11695_mux_s, in_scalarizer_11695_1, in_scalarizer_11695_0)
    BEGIN
        CASE (scalarizer_11695_mux_s) IS
            WHEN "0" => scalarizer_11695_mux_q <= in_scalarizer_11695_1;
            WHEN "1" => scalarizer_11695_mux_q <= in_scalarizer_11695_0;
            WHEN OTHERS => scalarizer_11695_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11695(GPOUT,165)
    out_scalarizer_11695 <= scalarizer_11695_mux_q;

    -- valid_or(LOGICAL,218)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,216)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,166)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,217)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,167)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- out_valid_out(GPOUT,168)
    out_valid_out <= valid_or_q;

END normal;
