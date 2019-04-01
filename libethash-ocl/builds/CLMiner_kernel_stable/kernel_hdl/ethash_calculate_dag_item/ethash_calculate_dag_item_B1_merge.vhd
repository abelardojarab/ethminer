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

-- VHDL created from ethash_calculate_dag_item_B1_merge
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

entity ethash_calculate_dag_item_B1_merge is
    port (
        in_acl_hw_wg_id43_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id43_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe116_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe116_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_dag_node_pm_0_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_dag_node_pm_0_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe116 : out std_logic_vector(31 downto 0);  -- ufix32
        out_dag_node_pm_0 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_r_0_i_i_ph : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01389 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01391 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01393 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01395 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01397 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01399 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01401 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01403 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01405 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01407 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01409 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01411 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01415 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01417 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01419 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01421 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01423 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01425 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01427 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01429 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11390 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11392 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11394 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11396 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11398 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11400 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11402 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11404 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11406 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11408 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11410 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11412 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11414 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11416 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11418 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11420 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11422 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11424 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11426 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11428 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11430 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B1_merge;

architecture normal of ethash_calculate_dag_item_B1_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id43_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id43_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe116_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe116_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dag_node_pm_0_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal dag_node_pm_0_mux_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal r_0_i_i_ph_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_0_i_i_ph_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01389_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01389_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01391_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01391_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01393_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01393_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01395_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01395_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01397_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01397_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01399_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01399_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01401_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01401_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01403_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01403_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01405_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01405_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01407_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01407_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01409_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01409_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01411_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01411_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01413_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01413_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01415_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01415_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01417_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01417_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01419_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01419_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01421_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01421_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01423_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01423_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01425_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01425_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01427_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01427_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01429_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01429_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11390_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11390_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11392_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11392_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11394_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11394_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11396_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11396_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11398_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11398_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11400_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11400_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11402_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11402_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11404_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11404_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11406_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11406_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11408_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11408_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11410_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11410_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11412_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11412_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11414_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11414_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11416_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11416_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11418_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11418_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11420_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11420_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11422_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11422_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11424_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11424_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11426_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11426_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11428_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11428_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11430_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11430_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- acl_hw_wg_id43_mux(MUX,2)
    acl_hw_wg_id43_mux_s <= in_valid_in_0;
    acl_hw_wg_id43_mux_combproc: PROCESS (acl_hw_wg_id43_mux_s, in_acl_hw_wg_id43_1, in_acl_hw_wg_id43_0)
    BEGIN
        CASE (acl_hw_wg_id43_mux_s) IS
            WHEN "0" => acl_hw_wg_id43_mux_q <= in_acl_hw_wg_id43_1;
            WHEN "1" => acl_hw_wg_id43_mux_q <= in_acl_hw_wg_id43_0;
            WHEN OTHERS => acl_hw_wg_id43_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_acl_hw_wg_id43(GPOUT,104)
    out_acl_hw_wg_id43 <= acl_hw_wg_id43_mux_q;

    -- c0_exe116_mux(MUX,3)
    c0_exe116_mux_s <= in_valid_in_0;
    c0_exe116_mux_combproc: PROCESS (c0_exe116_mux_s, in_c0_exe116_1, in_c0_exe116_0)
    BEGIN
        CASE (c0_exe116_mux_s) IS
            WHEN "0" => c0_exe116_mux_q <= in_c0_exe116_1;
            WHEN "1" => c0_exe116_mux_q <= in_c0_exe116_0;
            WHEN OTHERS => c0_exe116_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe116(GPOUT,105)
    out_c0_exe116 <= c0_exe116_mux_q;

    -- dag_node_pm_0_mux(MUX,4)
    dag_node_pm_0_mux_s <= in_valid_in_0;
    dag_node_pm_0_mux_combproc: PROCESS (dag_node_pm_0_mux_s, in_dag_node_pm_0_1, in_dag_node_pm_0_0)
    BEGIN
        CASE (dag_node_pm_0_mux_s) IS
            WHEN "0" => dag_node_pm_0_mux_q <= in_dag_node_pm_0_1;
            WHEN "1" => dag_node_pm_0_mux_q <= in_dag_node_pm_0_0;
            WHEN OTHERS => dag_node_pm_0_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_dag_node_pm_0(GPOUT,106)
    out_dag_node_pm_0 <= dag_node_pm_0_mux_q;

    -- r_0_i_i_ph_mux(MUX,155)
    r_0_i_i_ph_mux_s <= in_valid_in_0;
    r_0_i_i_ph_mux_combproc: PROCESS (r_0_i_i_ph_mux_s, in_r_0_i_i_ph_1, in_r_0_i_i_ph_0)
    BEGIN
        CASE (r_0_i_i_ph_mux_s) IS
            WHEN "0" => r_0_i_i_ph_mux_q <= in_r_0_i_i_ph_1;
            WHEN "1" => r_0_i_i_ph_mux_q <= in_r_0_i_i_ph_0;
            WHEN OTHERS => r_0_i_i_ph_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_r_0_i_i_ph(GPOUT,107)
    out_r_0_i_i_ph <= r_0_i_i_ph_mux_q;

    -- scalarizer_0_mux(MUX,177)
    scalarizer_0_mux_s <= in_valid_in_0;
    scalarizer_0_mux_combproc: PROCESS (scalarizer_0_mux_s, in_scalarizer_0_1, in_scalarizer_0_0)
    BEGIN
        CASE (scalarizer_0_mux_s) IS
            WHEN "0" => scalarizer_0_mux_q <= in_scalarizer_0_1;
            WHEN "1" => scalarizer_0_mux_q <= in_scalarizer_0_0;
            WHEN OTHERS => scalarizer_0_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0(GPOUT,108)
    out_scalarizer_0 <= scalarizer_0_mux_q;

    -- scalarizer_01389_mux(MUX,156)
    scalarizer_01389_mux_s <= in_valid_in_0;
    scalarizer_01389_mux_combproc: PROCESS (scalarizer_01389_mux_s, in_scalarizer_01389_1, in_scalarizer_01389_0)
    BEGIN
        CASE (scalarizer_01389_mux_s) IS
            WHEN "0" => scalarizer_01389_mux_q <= in_scalarizer_01389_1;
            WHEN "1" => scalarizer_01389_mux_q <= in_scalarizer_01389_0;
            WHEN OTHERS => scalarizer_01389_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01389(GPOUT,109)
    out_scalarizer_01389 <= scalarizer_01389_mux_q;

    -- scalarizer_01391_mux(MUX,157)
    scalarizer_01391_mux_s <= in_valid_in_0;
    scalarizer_01391_mux_combproc: PROCESS (scalarizer_01391_mux_s, in_scalarizer_01391_1, in_scalarizer_01391_0)
    BEGIN
        CASE (scalarizer_01391_mux_s) IS
            WHEN "0" => scalarizer_01391_mux_q <= in_scalarizer_01391_1;
            WHEN "1" => scalarizer_01391_mux_q <= in_scalarizer_01391_0;
            WHEN OTHERS => scalarizer_01391_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01391(GPOUT,110)
    out_scalarizer_01391 <= scalarizer_01391_mux_q;

    -- scalarizer_01393_mux(MUX,158)
    scalarizer_01393_mux_s <= in_valid_in_0;
    scalarizer_01393_mux_combproc: PROCESS (scalarizer_01393_mux_s, in_scalarizer_01393_1, in_scalarizer_01393_0)
    BEGIN
        CASE (scalarizer_01393_mux_s) IS
            WHEN "0" => scalarizer_01393_mux_q <= in_scalarizer_01393_1;
            WHEN "1" => scalarizer_01393_mux_q <= in_scalarizer_01393_0;
            WHEN OTHERS => scalarizer_01393_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01393(GPOUT,111)
    out_scalarizer_01393 <= scalarizer_01393_mux_q;

    -- scalarizer_01395_mux(MUX,159)
    scalarizer_01395_mux_s <= in_valid_in_0;
    scalarizer_01395_mux_combproc: PROCESS (scalarizer_01395_mux_s, in_scalarizer_01395_1, in_scalarizer_01395_0)
    BEGIN
        CASE (scalarizer_01395_mux_s) IS
            WHEN "0" => scalarizer_01395_mux_q <= in_scalarizer_01395_1;
            WHEN "1" => scalarizer_01395_mux_q <= in_scalarizer_01395_0;
            WHEN OTHERS => scalarizer_01395_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01395(GPOUT,112)
    out_scalarizer_01395 <= scalarizer_01395_mux_q;

    -- scalarizer_01397_mux(MUX,160)
    scalarizer_01397_mux_s <= in_valid_in_0;
    scalarizer_01397_mux_combproc: PROCESS (scalarizer_01397_mux_s, in_scalarizer_01397_1, in_scalarizer_01397_0)
    BEGIN
        CASE (scalarizer_01397_mux_s) IS
            WHEN "0" => scalarizer_01397_mux_q <= in_scalarizer_01397_1;
            WHEN "1" => scalarizer_01397_mux_q <= in_scalarizer_01397_0;
            WHEN OTHERS => scalarizer_01397_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01397(GPOUT,113)
    out_scalarizer_01397 <= scalarizer_01397_mux_q;

    -- scalarizer_01399_mux(MUX,161)
    scalarizer_01399_mux_s <= in_valid_in_0;
    scalarizer_01399_mux_combproc: PROCESS (scalarizer_01399_mux_s, in_scalarizer_01399_1, in_scalarizer_01399_0)
    BEGIN
        CASE (scalarizer_01399_mux_s) IS
            WHEN "0" => scalarizer_01399_mux_q <= in_scalarizer_01399_1;
            WHEN "1" => scalarizer_01399_mux_q <= in_scalarizer_01399_0;
            WHEN OTHERS => scalarizer_01399_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01399(GPOUT,114)
    out_scalarizer_01399 <= scalarizer_01399_mux_q;

    -- scalarizer_01401_mux(MUX,162)
    scalarizer_01401_mux_s <= in_valid_in_0;
    scalarizer_01401_mux_combproc: PROCESS (scalarizer_01401_mux_s, in_scalarizer_01401_1, in_scalarizer_01401_0)
    BEGIN
        CASE (scalarizer_01401_mux_s) IS
            WHEN "0" => scalarizer_01401_mux_q <= in_scalarizer_01401_1;
            WHEN "1" => scalarizer_01401_mux_q <= in_scalarizer_01401_0;
            WHEN OTHERS => scalarizer_01401_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01401(GPOUT,115)
    out_scalarizer_01401 <= scalarizer_01401_mux_q;

    -- scalarizer_01403_mux(MUX,163)
    scalarizer_01403_mux_s <= in_valid_in_0;
    scalarizer_01403_mux_combproc: PROCESS (scalarizer_01403_mux_s, in_scalarizer_01403_1, in_scalarizer_01403_0)
    BEGIN
        CASE (scalarizer_01403_mux_s) IS
            WHEN "0" => scalarizer_01403_mux_q <= in_scalarizer_01403_1;
            WHEN "1" => scalarizer_01403_mux_q <= in_scalarizer_01403_0;
            WHEN OTHERS => scalarizer_01403_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01403(GPOUT,116)
    out_scalarizer_01403 <= scalarizer_01403_mux_q;

    -- scalarizer_01405_mux(MUX,164)
    scalarizer_01405_mux_s <= in_valid_in_0;
    scalarizer_01405_mux_combproc: PROCESS (scalarizer_01405_mux_s, in_scalarizer_01405_1, in_scalarizer_01405_0)
    BEGIN
        CASE (scalarizer_01405_mux_s) IS
            WHEN "0" => scalarizer_01405_mux_q <= in_scalarizer_01405_1;
            WHEN "1" => scalarizer_01405_mux_q <= in_scalarizer_01405_0;
            WHEN OTHERS => scalarizer_01405_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01405(GPOUT,117)
    out_scalarizer_01405 <= scalarizer_01405_mux_q;

    -- scalarizer_01407_mux(MUX,165)
    scalarizer_01407_mux_s <= in_valid_in_0;
    scalarizer_01407_mux_combproc: PROCESS (scalarizer_01407_mux_s, in_scalarizer_01407_1, in_scalarizer_01407_0)
    BEGIN
        CASE (scalarizer_01407_mux_s) IS
            WHEN "0" => scalarizer_01407_mux_q <= in_scalarizer_01407_1;
            WHEN "1" => scalarizer_01407_mux_q <= in_scalarizer_01407_0;
            WHEN OTHERS => scalarizer_01407_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01407(GPOUT,118)
    out_scalarizer_01407 <= scalarizer_01407_mux_q;

    -- scalarizer_01409_mux(MUX,166)
    scalarizer_01409_mux_s <= in_valid_in_0;
    scalarizer_01409_mux_combproc: PROCESS (scalarizer_01409_mux_s, in_scalarizer_01409_1, in_scalarizer_01409_0)
    BEGIN
        CASE (scalarizer_01409_mux_s) IS
            WHEN "0" => scalarizer_01409_mux_q <= in_scalarizer_01409_1;
            WHEN "1" => scalarizer_01409_mux_q <= in_scalarizer_01409_0;
            WHEN OTHERS => scalarizer_01409_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01409(GPOUT,119)
    out_scalarizer_01409 <= scalarizer_01409_mux_q;

    -- scalarizer_01411_mux(MUX,167)
    scalarizer_01411_mux_s <= in_valid_in_0;
    scalarizer_01411_mux_combproc: PROCESS (scalarizer_01411_mux_s, in_scalarizer_01411_1, in_scalarizer_01411_0)
    BEGIN
        CASE (scalarizer_01411_mux_s) IS
            WHEN "0" => scalarizer_01411_mux_q <= in_scalarizer_01411_1;
            WHEN "1" => scalarizer_01411_mux_q <= in_scalarizer_01411_0;
            WHEN OTHERS => scalarizer_01411_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01411(GPOUT,120)
    out_scalarizer_01411 <= scalarizer_01411_mux_q;

    -- scalarizer_01413_mux(MUX,168)
    scalarizer_01413_mux_s <= in_valid_in_0;
    scalarizer_01413_mux_combproc: PROCESS (scalarizer_01413_mux_s, in_scalarizer_01413_1, in_scalarizer_01413_0)
    BEGIN
        CASE (scalarizer_01413_mux_s) IS
            WHEN "0" => scalarizer_01413_mux_q <= in_scalarizer_01413_1;
            WHEN "1" => scalarizer_01413_mux_q <= in_scalarizer_01413_0;
            WHEN OTHERS => scalarizer_01413_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01413(GPOUT,121)
    out_scalarizer_01413 <= scalarizer_01413_mux_q;

    -- scalarizer_01415_mux(MUX,169)
    scalarizer_01415_mux_s <= in_valid_in_0;
    scalarizer_01415_mux_combproc: PROCESS (scalarizer_01415_mux_s, in_scalarizer_01415_1, in_scalarizer_01415_0)
    BEGIN
        CASE (scalarizer_01415_mux_s) IS
            WHEN "0" => scalarizer_01415_mux_q <= in_scalarizer_01415_1;
            WHEN "1" => scalarizer_01415_mux_q <= in_scalarizer_01415_0;
            WHEN OTHERS => scalarizer_01415_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01415(GPOUT,122)
    out_scalarizer_01415 <= scalarizer_01415_mux_q;

    -- scalarizer_01417_mux(MUX,170)
    scalarizer_01417_mux_s <= in_valid_in_0;
    scalarizer_01417_mux_combproc: PROCESS (scalarizer_01417_mux_s, in_scalarizer_01417_1, in_scalarizer_01417_0)
    BEGIN
        CASE (scalarizer_01417_mux_s) IS
            WHEN "0" => scalarizer_01417_mux_q <= in_scalarizer_01417_1;
            WHEN "1" => scalarizer_01417_mux_q <= in_scalarizer_01417_0;
            WHEN OTHERS => scalarizer_01417_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01417(GPOUT,123)
    out_scalarizer_01417 <= scalarizer_01417_mux_q;

    -- scalarizer_01419_mux(MUX,171)
    scalarizer_01419_mux_s <= in_valid_in_0;
    scalarizer_01419_mux_combproc: PROCESS (scalarizer_01419_mux_s, in_scalarizer_01419_1, in_scalarizer_01419_0)
    BEGIN
        CASE (scalarizer_01419_mux_s) IS
            WHEN "0" => scalarizer_01419_mux_q <= in_scalarizer_01419_1;
            WHEN "1" => scalarizer_01419_mux_q <= in_scalarizer_01419_0;
            WHEN OTHERS => scalarizer_01419_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01419(GPOUT,124)
    out_scalarizer_01419 <= scalarizer_01419_mux_q;

    -- scalarizer_01421_mux(MUX,172)
    scalarizer_01421_mux_s <= in_valid_in_0;
    scalarizer_01421_mux_combproc: PROCESS (scalarizer_01421_mux_s, in_scalarizer_01421_1, in_scalarizer_01421_0)
    BEGIN
        CASE (scalarizer_01421_mux_s) IS
            WHEN "0" => scalarizer_01421_mux_q <= in_scalarizer_01421_1;
            WHEN "1" => scalarizer_01421_mux_q <= in_scalarizer_01421_0;
            WHEN OTHERS => scalarizer_01421_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01421(GPOUT,125)
    out_scalarizer_01421 <= scalarizer_01421_mux_q;

    -- scalarizer_01423_mux(MUX,173)
    scalarizer_01423_mux_s <= in_valid_in_0;
    scalarizer_01423_mux_combproc: PROCESS (scalarizer_01423_mux_s, in_scalarizer_01423_1, in_scalarizer_01423_0)
    BEGIN
        CASE (scalarizer_01423_mux_s) IS
            WHEN "0" => scalarizer_01423_mux_q <= in_scalarizer_01423_1;
            WHEN "1" => scalarizer_01423_mux_q <= in_scalarizer_01423_0;
            WHEN OTHERS => scalarizer_01423_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01423(GPOUT,126)
    out_scalarizer_01423 <= scalarizer_01423_mux_q;

    -- scalarizer_01425_mux(MUX,174)
    scalarizer_01425_mux_s <= in_valid_in_0;
    scalarizer_01425_mux_combproc: PROCESS (scalarizer_01425_mux_s, in_scalarizer_01425_1, in_scalarizer_01425_0)
    BEGIN
        CASE (scalarizer_01425_mux_s) IS
            WHEN "0" => scalarizer_01425_mux_q <= in_scalarizer_01425_1;
            WHEN "1" => scalarizer_01425_mux_q <= in_scalarizer_01425_0;
            WHEN OTHERS => scalarizer_01425_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01425(GPOUT,127)
    out_scalarizer_01425 <= scalarizer_01425_mux_q;

    -- scalarizer_01427_mux(MUX,175)
    scalarizer_01427_mux_s <= in_valid_in_0;
    scalarizer_01427_mux_combproc: PROCESS (scalarizer_01427_mux_s, in_scalarizer_01427_1, in_scalarizer_01427_0)
    BEGIN
        CASE (scalarizer_01427_mux_s) IS
            WHEN "0" => scalarizer_01427_mux_q <= in_scalarizer_01427_1;
            WHEN "1" => scalarizer_01427_mux_q <= in_scalarizer_01427_0;
            WHEN OTHERS => scalarizer_01427_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01427(GPOUT,128)
    out_scalarizer_01427 <= scalarizer_01427_mux_q;

    -- scalarizer_01429_mux(MUX,176)
    scalarizer_01429_mux_s <= in_valid_in_0;
    scalarizer_01429_mux_combproc: PROCESS (scalarizer_01429_mux_s, in_scalarizer_01429_1, in_scalarizer_01429_0)
    BEGIN
        CASE (scalarizer_01429_mux_s) IS
            WHEN "0" => scalarizer_01429_mux_q <= in_scalarizer_01429_1;
            WHEN "1" => scalarizer_01429_mux_q <= in_scalarizer_01429_0;
            WHEN OTHERS => scalarizer_01429_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01429(GPOUT,129)
    out_scalarizer_01429 <= scalarizer_01429_mux_q;

    -- scalarizer_1_mux(MUX,199)
    scalarizer_1_mux_s <= in_valid_in_0;
    scalarizer_1_mux_combproc: PROCESS (scalarizer_1_mux_s, in_scalarizer_1_1, in_scalarizer_1_0)
    BEGIN
        CASE (scalarizer_1_mux_s) IS
            WHEN "0" => scalarizer_1_mux_q <= in_scalarizer_1_1;
            WHEN "1" => scalarizer_1_mux_q <= in_scalarizer_1_0;
            WHEN OTHERS => scalarizer_1_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1(GPOUT,130)
    out_scalarizer_1 <= scalarizer_1_mux_q;

    -- scalarizer_11390_mux(MUX,178)
    scalarizer_11390_mux_s <= in_valid_in_0;
    scalarizer_11390_mux_combproc: PROCESS (scalarizer_11390_mux_s, in_scalarizer_11390_1, in_scalarizer_11390_0)
    BEGIN
        CASE (scalarizer_11390_mux_s) IS
            WHEN "0" => scalarizer_11390_mux_q <= in_scalarizer_11390_1;
            WHEN "1" => scalarizer_11390_mux_q <= in_scalarizer_11390_0;
            WHEN OTHERS => scalarizer_11390_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11390(GPOUT,131)
    out_scalarizer_11390 <= scalarizer_11390_mux_q;

    -- scalarizer_11392_mux(MUX,179)
    scalarizer_11392_mux_s <= in_valid_in_0;
    scalarizer_11392_mux_combproc: PROCESS (scalarizer_11392_mux_s, in_scalarizer_11392_1, in_scalarizer_11392_0)
    BEGIN
        CASE (scalarizer_11392_mux_s) IS
            WHEN "0" => scalarizer_11392_mux_q <= in_scalarizer_11392_1;
            WHEN "1" => scalarizer_11392_mux_q <= in_scalarizer_11392_0;
            WHEN OTHERS => scalarizer_11392_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11392(GPOUT,132)
    out_scalarizer_11392 <= scalarizer_11392_mux_q;

    -- scalarizer_11394_mux(MUX,180)
    scalarizer_11394_mux_s <= in_valid_in_0;
    scalarizer_11394_mux_combproc: PROCESS (scalarizer_11394_mux_s, in_scalarizer_11394_1, in_scalarizer_11394_0)
    BEGIN
        CASE (scalarizer_11394_mux_s) IS
            WHEN "0" => scalarizer_11394_mux_q <= in_scalarizer_11394_1;
            WHEN "1" => scalarizer_11394_mux_q <= in_scalarizer_11394_0;
            WHEN OTHERS => scalarizer_11394_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11394(GPOUT,133)
    out_scalarizer_11394 <= scalarizer_11394_mux_q;

    -- scalarizer_11396_mux(MUX,181)
    scalarizer_11396_mux_s <= in_valid_in_0;
    scalarizer_11396_mux_combproc: PROCESS (scalarizer_11396_mux_s, in_scalarizer_11396_1, in_scalarizer_11396_0)
    BEGIN
        CASE (scalarizer_11396_mux_s) IS
            WHEN "0" => scalarizer_11396_mux_q <= in_scalarizer_11396_1;
            WHEN "1" => scalarizer_11396_mux_q <= in_scalarizer_11396_0;
            WHEN OTHERS => scalarizer_11396_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11396(GPOUT,134)
    out_scalarizer_11396 <= scalarizer_11396_mux_q;

    -- scalarizer_11398_mux(MUX,182)
    scalarizer_11398_mux_s <= in_valid_in_0;
    scalarizer_11398_mux_combproc: PROCESS (scalarizer_11398_mux_s, in_scalarizer_11398_1, in_scalarizer_11398_0)
    BEGIN
        CASE (scalarizer_11398_mux_s) IS
            WHEN "0" => scalarizer_11398_mux_q <= in_scalarizer_11398_1;
            WHEN "1" => scalarizer_11398_mux_q <= in_scalarizer_11398_0;
            WHEN OTHERS => scalarizer_11398_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11398(GPOUT,135)
    out_scalarizer_11398 <= scalarizer_11398_mux_q;

    -- scalarizer_11400_mux(MUX,183)
    scalarizer_11400_mux_s <= in_valid_in_0;
    scalarizer_11400_mux_combproc: PROCESS (scalarizer_11400_mux_s, in_scalarizer_11400_1, in_scalarizer_11400_0)
    BEGIN
        CASE (scalarizer_11400_mux_s) IS
            WHEN "0" => scalarizer_11400_mux_q <= in_scalarizer_11400_1;
            WHEN "1" => scalarizer_11400_mux_q <= in_scalarizer_11400_0;
            WHEN OTHERS => scalarizer_11400_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11400(GPOUT,136)
    out_scalarizer_11400 <= scalarizer_11400_mux_q;

    -- scalarizer_11402_mux(MUX,184)
    scalarizer_11402_mux_s <= in_valid_in_0;
    scalarizer_11402_mux_combproc: PROCESS (scalarizer_11402_mux_s, in_scalarizer_11402_1, in_scalarizer_11402_0)
    BEGIN
        CASE (scalarizer_11402_mux_s) IS
            WHEN "0" => scalarizer_11402_mux_q <= in_scalarizer_11402_1;
            WHEN "1" => scalarizer_11402_mux_q <= in_scalarizer_11402_0;
            WHEN OTHERS => scalarizer_11402_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11402(GPOUT,137)
    out_scalarizer_11402 <= scalarizer_11402_mux_q;

    -- scalarizer_11404_mux(MUX,185)
    scalarizer_11404_mux_s <= in_valid_in_0;
    scalarizer_11404_mux_combproc: PROCESS (scalarizer_11404_mux_s, in_scalarizer_11404_1, in_scalarizer_11404_0)
    BEGIN
        CASE (scalarizer_11404_mux_s) IS
            WHEN "0" => scalarizer_11404_mux_q <= in_scalarizer_11404_1;
            WHEN "1" => scalarizer_11404_mux_q <= in_scalarizer_11404_0;
            WHEN OTHERS => scalarizer_11404_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11404(GPOUT,138)
    out_scalarizer_11404 <= scalarizer_11404_mux_q;

    -- scalarizer_11406_mux(MUX,186)
    scalarizer_11406_mux_s <= in_valid_in_0;
    scalarizer_11406_mux_combproc: PROCESS (scalarizer_11406_mux_s, in_scalarizer_11406_1, in_scalarizer_11406_0)
    BEGIN
        CASE (scalarizer_11406_mux_s) IS
            WHEN "0" => scalarizer_11406_mux_q <= in_scalarizer_11406_1;
            WHEN "1" => scalarizer_11406_mux_q <= in_scalarizer_11406_0;
            WHEN OTHERS => scalarizer_11406_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11406(GPOUT,139)
    out_scalarizer_11406 <= scalarizer_11406_mux_q;

    -- scalarizer_11408_mux(MUX,187)
    scalarizer_11408_mux_s <= in_valid_in_0;
    scalarizer_11408_mux_combproc: PROCESS (scalarizer_11408_mux_s, in_scalarizer_11408_1, in_scalarizer_11408_0)
    BEGIN
        CASE (scalarizer_11408_mux_s) IS
            WHEN "0" => scalarizer_11408_mux_q <= in_scalarizer_11408_1;
            WHEN "1" => scalarizer_11408_mux_q <= in_scalarizer_11408_0;
            WHEN OTHERS => scalarizer_11408_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11408(GPOUT,140)
    out_scalarizer_11408 <= scalarizer_11408_mux_q;

    -- scalarizer_11410_mux(MUX,188)
    scalarizer_11410_mux_s <= in_valid_in_0;
    scalarizer_11410_mux_combproc: PROCESS (scalarizer_11410_mux_s, in_scalarizer_11410_1, in_scalarizer_11410_0)
    BEGIN
        CASE (scalarizer_11410_mux_s) IS
            WHEN "0" => scalarizer_11410_mux_q <= in_scalarizer_11410_1;
            WHEN "1" => scalarizer_11410_mux_q <= in_scalarizer_11410_0;
            WHEN OTHERS => scalarizer_11410_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11410(GPOUT,141)
    out_scalarizer_11410 <= scalarizer_11410_mux_q;

    -- scalarizer_11412_mux(MUX,189)
    scalarizer_11412_mux_s <= in_valid_in_0;
    scalarizer_11412_mux_combproc: PROCESS (scalarizer_11412_mux_s, in_scalarizer_11412_1, in_scalarizer_11412_0)
    BEGIN
        CASE (scalarizer_11412_mux_s) IS
            WHEN "0" => scalarizer_11412_mux_q <= in_scalarizer_11412_1;
            WHEN "1" => scalarizer_11412_mux_q <= in_scalarizer_11412_0;
            WHEN OTHERS => scalarizer_11412_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11412(GPOUT,142)
    out_scalarizer_11412 <= scalarizer_11412_mux_q;

    -- scalarizer_11414_mux(MUX,190)
    scalarizer_11414_mux_s <= in_valid_in_0;
    scalarizer_11414_mux_combproc: PROCESS (scalarizer_11414_mux_s, in_scalarizer_11414_1, in_scalarizer_11414_0)
    BEGIN
        CASE (scalarizer_11414_mux_s) IS
            WHEN "0" => scalarizer_11414_mux_q <= in_scalarizer_11414_1;
            WHEN "1" => scalarizer_11414_mux_q <= in_scalarizer_11414_0;
            WHEN OTHERS => scalarizer_11414_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11414(GPOUT,143)
    out_scalarizer_11414 <= scalarizer_11414_mux_q;

    -- scalarizer_11416_mux(MUX,191)
    scalarizer_11416_mux_s <= in_valid_in_0;
    scalarizer_11416_mux_combproc: PROCESS (scalarizer_11416_mux_s, in_scalarizer_11416_1, in_scalarizer_11416_0)
    BEGIN
        CASE (scalarizer_11416_mux_s) IS
            WHEN "0" => scalarizer_11416_mux_q <= in_scalarizer_11416_1;
            WHEN "1" => scalarizer_11416_mux_q <= in_scalarizer_11416_0;
            WHEN OTHERS => scalarizer_11416_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11416(GPOUT,144)
    out_scalarizer_11416 <= scalarizer_11416_mux_q;

    -- scalarizer_11418_mux(MUX,192)
    scalarizer_11418_mux_s <= in_valid_in_0;
    scalarizer_11418_mux_combproc: PROCESS (scalarizer_11418_mux_s, in_scalarizer_11418_1, in_scalarizer_11418_0)
    BEGIN
        CASE (scalarizer_11418_mux_s) IS
            WHEN "0" => scalarizer_11418_mux_q <= in_scalarizer_11418_1;
            WHEN "1" => scalarizer_11418_mux_q <= in_scalarizer_11418_0;
            WHEN OTHERS => scalarizer_11418_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11418(GPOUT,145)
    out_scalarizer_11418 <= scalarizer_11418_mux_q;

    -- scalarizer_11420_mux(MUX,193)
    scalarizer_11420_mux_s <= in_valid_in_0;
    scalarizer_11420_mux_combproc: PROCESS (scalarizer_11420_mux_s, in_scalarizer_11420_1, in_scalarizer_11420_0)
    BEGIN
        CASE (scalarizer_11420_mux_s) IS
            WHEN "0" => scalarizer_11420_mux_q <= in_scalarizer_11420_1;
            WHEN "1" => scalarizer_11420_mux_q <= in_scalarizer_11420_0;
            WHEN OTHERS => scalarizer_11420_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11420(GPOUT,146)
    out_scalarizer_11420 <= scalarizer_11420_mux_q;

    -- scalarizer_11422_mux(MUX,194)
    scalarizer_11422_mux_s <= in_valid_in_0;
    scalarizer_11422_mux_combproc: PROCESS (scalarizer_11422_mux_s, in_scalarizer_11422_1, in_scalarizer_11422_0)
    BEGIN
        CASE (scalarizer_11422_mux_s) IS
            WHEN "0" => scalarizer_11422_mux_q <= in_scalarizer_11422_1;
            WHEN "1" => scalarizer_11422_mux_q <= in_scalarizer_11422_0;
            WHEN OTHERS => scalarizer_11422_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11422(GPOUT,147)
    out_scalarizer_11422 <= scalarizer_11422_mux_q;

    -- scalarizer_11424_mux(MUX,195)
    scalarizer_11424_mux_s <= in_valid_in_0;
    scalarizer_11424_mux_combproc: PROCESS (scalarizer_11424_mux_s, in_scalarizer_11424_1, in_scalarizer_11424_0)
    BEGIN
        CASE (scalarizer_11424_mux_s) IS
            WHEN "0" => scalarizer_11424_mux_q <= in_scalarizer_11424_1;
            WHEN "1" => scalarizer_11424_mux_q <= in_scalarizer_11424_0;
            WHEN OTHERS => scalarizer_11424_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11424(GPOUT,148)
    out_scalarizer_11424 <= scalarizer_11424_mux_q;

    -- scalarizer_11426_mux(MUX,196)
    scalarizer_11426_mux_s <= in_valid_in_0;
    scalarizer_11426_mux_combproc: PROCESS (scalarizer_11426_mux_s, in_scalarizer_11426_1, in_scalarizer_11426_0)
    BEGIN
        CASE (scalarizer_11426_mux_s) IS
            WHEN "0" => scalarizer_11426_mux_q <= in_scalarizer_11426_1;
            WHEN "1" => scalarizer_11426_mux_q <= in_scalarizer_11426_0;
            WHEN OTHERS => scalarizer_11426_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11426(GPOUT,149)
    out_scalarizer_11426 <= scalarizer_11426_mux_q;

    -- scalarizer_11428_mux(MUX,197)
    scalarizer_11428_mux_s <= in_valid_in_0;
    scalarizer_11428_mux_combproc: PROCESS (scalarizer_11428_mux_s, in_scalarizer_11428_1, in_scalarizer_11428_0)
    BEGIN
        CASE (scalarizer_11428_mux_s) IS
            WHEN "0" => scalarizer_11428_mux_q <= in_scalarizer_11428_1;
            WHEN "1" => scalarizer_11428_mux_q <= in_scalarizer_11428_0;
            WHEN OTHERS => scalarizer_11428_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11428(GPOUT,150)
    out_scalarizer_11428 <= scalarizer_11428_mux_q;

    -- scalarizer_11430_mux(MUX,198)
    scalarizer_11430_mux_s <= in_valid_in_0;
    scalarizer_11430_mux_combproc: PROCESS (scalarizer_11430_mux_s, in_scalarizer_11430_1, in_scalarizer_11430_0)
    BEGIN
        CASE (scalarizer_11430_mux_s) IS
            WHEN "0" => scalarizer_11430_mux_q <= in_scalarizer_11430_1;
            WHEN "1" => scalarizer_11430_mux_q <= in_scalarizer_11430_0;
            WHEN OTHERS => scalarizer_11430_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11430(GPOUT,151)
    out_scalarizer_11430 <= scalarizer_11430_mux_q;

    -- valid_or(LOGICAL,202)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,200)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,152)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,201)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,153)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- out_valid_out(GPOUT,154)
    out_valid_out <= valid_or_q;

END normal;
