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

-- VHDL created from ethash_calculate_dag_item_B3_merge
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

entity ethash_calculate_dag_item_B3_merge is
    port (
        in_acl_hw_wg_id41_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id41_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11221_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11221_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe114_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe114_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21326_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe21326_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dag_node_pm_1_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_dag_node_pm_1_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_fpgaindvars_iv_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_fpgaindvars_iv_1 : in std_logic_vector(8 downto 0);  -- ufix9
        in_i11_0687_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i11_0687_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01585_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01585_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01587_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01587_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01591_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01591_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01595_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01595_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11586_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11586_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11588_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11588_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11592_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11592_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11596_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11596_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21589_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21589_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21593_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21593_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21597_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21597_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31590_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31590_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31594_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31594_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31598_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31598_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11221 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21326 : out std_logic_vector(0 downto 0);  -- ufix1
        out_dag_node_pm_1 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_fpgaindvars_iv : out std_logic_vector(8 downto 0);  -- ufix9
        out_i11_0687 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01585 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01587 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01591 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01595 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11586 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11588 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11592 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11596 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_21589 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_21593 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_21597 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_31590 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_31594 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_31598 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B3_merge;

architecture normal of ethash_calculate_dag_item_B3_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id41_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_hw_wg_id41_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11221_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11221_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe114_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe114_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe21326_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe21326_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dag_node_pm_1_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal dag_node_pm_1_mux_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal fpgaindvars_iv_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i11_0687_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i11_0687_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01585_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01585_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01587_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01587_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01591_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01591_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01595_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01595_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11586_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11586_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11588_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11588_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11592_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11592_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11596_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11596_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_21589_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_21589_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_21593_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_21593_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_21597_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_21597_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_2_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_2_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_31590_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_31590_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_31594_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_31594_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_31598_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_31598_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_3_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_3_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- acl_hw_wg_id41_mux(MUX,2)
    acl_hw_wg_id41_mux_s <= in_valid_in_0;
    acl_hw_wg_id41_mux_combproc: PROCESS (acl_hw_wg_id41_mux_s, in_acl_hw_wg_id41_1, in_acl_hw_wg_id41_0)
    BEGIN
        CASE (acl_hw_wg_id41_mux_s) IS
            WHEN "0" => acl_hw_wg_id41_mux_q <= in_acl_hw_wg_id41_1;
            WHEN "1" => acl_hw_wg_id41_mux_q <= in_acl_hw_wg_id41_0;
            WHEN OTHERS => acl_hw_wg_id41_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_acl_hw_wg_id41(GPOUT,58)
    out_acl_hw_wg_id41 <= acl_hw_wg_id41_mux_q;

    -- c0_exe11221_mux(MUX,3)
    c0_exe11221_mux_s <= in_valid_in_0;
    c0_exe11221_mux_combproc: PROCESS (c0_exe11221_mux_s, in_c0_exe11221_1, in_c0_exe11221_0)
    BEGIN
        CASE (c0_exe11221_mux_s) IS
            WHEN "0" => c0_exe11221_mux_q <= in_c0_exe11221_1;
            WHEN "1" => c0_exe11221_mux_q <= in_c0_exe11221_0;
            WHEN OTHERS => c0_exe11221_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe11221(GPOUT,59)
    out_c0_exe11221 <= c0_exe11221_mux_q;

    -- c0_exe114_mux(MUX,4)
    c0_exe114_mux_s <= in_valid_in_0;
    c0_exe114_mux_combproc: PROCESS (c0_exe114_mux_s, in_c0_exe114_1, in_c0_exe114_0)
    BEGIN
        CASE (c0_exe114_mux_s) IS
            WHEN "0" => c0_exe114_mux_q <= in_c0_exe114_1;
            WHEN "1" => c0_exe114_mux_q <= in_c0_exe114_0;
            WHEN OTHERS => c0_exe114_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe114(GPOUT,60)
    out_c0_exe114 <= c0_exe114_mux_q;

    -- c0_exe21326_mux(MUX,5)
    c0_exe21326_mux_s <= in_valid_in_0;
    c0_exe21326_mux_combproc: PROCESS (c0_exe21326_mux_s, in_c0_exe21326_1, in_c0_exe21326_0)
    BEGIN
        CASE (c0_exe21326_mux_s) IS
            WHEN "0" => c0_exe21326_mux_q <= in_c0_exe21326_1;
            WHEN "1" => c0_exe21326_mux_q <= in_c0_exe21326_0;
            WHEN OTHERS => c0_exe21326_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe21326(GPOUT,61)
    out_c0_exe21326 <= c0_exe21326_mux_q;

    -- dag_node_pm_1_mux(MUX,6)
    dag_node_pm_1_mux_s <= in_valid_in_0;
    dag_node_pm_1_mux_combproc: PROCESS (dag_node_pm_1_mux_s, in_dag_node_pm_1_1, in_dag_node_pm_1_0)
    BEGIN
        CASE (dag_node_pm_1_mux_s) IS
            WHEN "0" => dag_node_pm_1_mux_q <= in_dag_node_pm_1_1;
            WHEN "1" => dag_node_pm_1_mux_q <= in_dag_node_pm_1_0;
            WHEN OTHERS => dag_node_pm_1_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_dag_node_pm_1(GPOUT,62)
    out_dag_node_pm_1 <= dag_node_pm_1_mux_q;

    -- fpgaindvars_iv_mux(MUX,7)
    fpgaindvars_iv_mux_s <= in_valid_in_0;
    fpgaindvars_iv_mux_combproc: PROCESS (fpgaindvars_iv_mux_s, in_fpgaindvars_iv_1, in_fpgaindvars_iv_0)
    BEGIN
        CASE (fpgaindvars_iv_mux_s) IS
            WHEN "0" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_1;
            WHEN "1" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_0;
            WHEN OTHERS => fpgaindvars_iv_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv(GPOUT,63)
    out_fpgaindvars_iv <= fpgaindvars_iv_mux_q;

    -- i11_0687_mux(MUX,8)
    i11_0687_mux_s <= in_valid_in_0;
    i11_0687_mux_combproc: PROCESS (i11_0687_mux_s, in_i11_0687_1, in_i11_0687_0)
    BEGIN
        CASE (i11_0687_mux_s) IS
            WHEN "0" => i11_0687_mux_q <= in_i11_0687_1;
            WHEN "1" => i11_0687_mux_q <= in_i11_0687_0;
            WHEN OTHERS => i11_0687_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i11_0687(GPOUT,64)
    out_i11_0687 <= i11_0687_mux_q;

    -- scalarizer_01585_mux(MUX,84)
    scalarizer_01585_mux_s <= in_valid_in_0;
    scalarizer_01585_mux_combproc: PROCESS (scalarizer_01585_mux_s, in_scalarizer_01585_1, in_scalarizer_01585_0)
    BEGIN
        CASE (scalarizer_01585_mux_s) IS
            WHEN "0" => scalarizer_01585_mux_q <= in_scalarizer_01585_1;
            WHEN "1" => scalarizer_01585_mux_q <= in_scalarizer_01585_0;
            WHEN OTHERS => scalarizer_01585_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01585(GPOUT,65)
    out_scalarizer_01585 <= scalarizer_01585_mux_q;

    -- scalarizer_01587_mux(MUX,85)
    scalarizer_01587_mux_s <= in_valid_in_0;
    scalarizer_01587_mux_combproc: PROCESS (scalarizer_01587_mux_s, in_scalarizer_01587_1, in_scalarizer_01587_0)
    BEGIN
        CASE (scalarizer_01587_mux_s) IS
            WHEN "0" => scalarizer_01587_mux_q <= in_scalarizer_01587_1;
            WHEN "1" => scalarizer_01587_mux_q <= in_scalarizer_01587_0;
            WHEN OTHERS => scalarizer_01587_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01587(GPOUT,66)
    out_scalarizer_01587 <= scalarizer_01587_mux_q;

    -- scalarizer_01591_mux(MUX,86)
    scalarizer_01591_mux_s <= in_valid_in_0;
    scalarizer_01591_mux_combproc: PROCESS (scalarizer_01591_mux_s, in_scalarizer_01591_1, in_scalarizer_01591_0)
    BEGIN
        CASE (scalarizer_01591_mux_s) IS
            WHEN "0" => scalarizer_01591_mux_q <= in_scalarizer_01591_1;
            WHEN "1" => scalarizer_01591_mux_q <= in_scalarizer_01591_0;
            WHEN OTHERS => scalarizer_01591_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01591(GPOUT,67)
    out_scalarizer_01591 <= scalarizer_01591_mux_q;

    -- scalarizer_01595_mux(MUX,87)
    scalarizer_01595_mux_s <= in_valid_in_0;
    scalarizer_01595_mux_combproc: PROCESS (scalarizer_01595_mux_s, in_scalarizer_01595_1, in_scalarizer_01595_0)
    BEGIN
        CASE (scalarizer_01595_mux_s) IS
            WHEN "0" => scalarizer_01595_mux_q <= in_scalarizer_01595_1;
            WHEN "1" => scalarizer_01595_mux_q <= in_scalarizer_01595_0;
            WHEN OTHERS => scalarizer_01595_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01595(GPOUT,68)
    out_scalarizer_01595 <= scalarizer_01595_mux_q;

    -- scalarizer_11586_mux(MUX,88)
    scalarizer_11586_mux_s <= in_valid_in_0;
    scalarizer_11586_mux_combproc: PROCESS (scalarizer_11586_mux_s, in_scalarizer_11586_1, in_scalarizer_11586_0)
    BEGIN
        CASE (scalarizer_11586_mux_s) IS
            WHEN "0" => scalarizer_11586_mux_q <= in_scalarizer_11586_1;
            WHEN "1" => scalarizer_11586_mux_q <= in_scalarizer_11586_0;
            WHEN OTHERS => scalarizer_11586_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11586(GPOUT,69)
    out_scalarizer_11586 <= scalarizer_11586_mux_q;

    -- scalarizer_11588_mux(MUX,89)
    scalarizer_11588_mux_s <= in_valid_in_0;
    scalarizer_11588_mux_combproc: PROCESS (scalarizer_11588_mux_s, in_scalarizer_11588_1, in_scalarizer_11588_0)
    BEGIN
        CASE (scalarizer_11588_mux_s) IS
            WHEN "0" => scalarizer_11588_mux_q <= in_scalarizer_11588_1;
            WHEN "1" => scalarizer_11588_mux_q <= in_scalarizer_11588_0;
            WHEN OTHERS => scalarizer_11588_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11588(GPOUT,70)
    out_scalarizer_11588 <= scalarizer_11588_mux_q;

    -- scalarizer_11592_mux(MUX,90)
    scalarizer_11592_mux_s <= in_valid_in_0;
    scalarizer_11592_mux_combproc: PROCESS (scalarizer_11592_mux_s, in_scalarizer_11592_1, in_scalarizer_11592_0)
    BEGIN
        CASE (scalarizer_11592_mux_s) IS
            WHEN "0" => scalarizer_11592_mux_q <= in_scalarizer_11592_1;
            WHEN "1" => scalarizer_11592_mux_q <= in_scalarizer_11592_0;
            WHEN OTHERS => scalarizer_11592_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11592(GPOUT,71)
    out_scalarizer_11592 <= scalarizer_11592_mux_q;

    -- scalarizer_11596_mux(MUX,91)
    scalarizer_11596_mux_s <= in_valid_in_0;
    scalarizer_11596_mux_combproc: PROCESS (scalarizer_11596_mux_s, in_scalarizer_11596_1, in_scalarizer_11596_0)
    BEGIN
        CASE (scalarizer_11596_mux_s) IS
            WHEN "0" => scalarizer_11596_mux_q <= in_scalarizer_11596_1;
            WHEN "1" => scalarizer_11596_mux_q <= in_scalarizer_11596_0;
            WHEN OTHERS => scalarizer_11596_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11596(GPOUT,72)
    out_scalarizer_11596 <= scalarizer_11596_mux_q;

    -- scalarizer_2_mux(MUX,95)
    scalarizer_2_mux_s <= in_valid_in_0;
    scalarizer_2_mux_combproc: PROCESS (scalarizer_2_mux_s, in_scalarizer_2_1, in_scalarizer_2_0)
    BEGIN
        CASE (scalarizer_2_mux_s) IS
            WHEN "0" => scalarizer_2_mux_q <= in_scalarizer_2_1;
            WHEN "1" => scalarizer_2_mux_q <= in_scalarizer_2_0;
            WHEN OTHERS => scalarizer_2_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_2(GPOUT,73)
    out_scalarizer_2 <= scalarizer_2_mux_q;

    -- scalarizer_21589_mux(MUX,92)
    scalarizer_21589_mux_s <= in_valid_in_0;
    scalarizer_21589_mux_combproc: PROCESS (scalarizer_21589_mux_s, in_scalarizer_21589_1, in_scalarizer_21589_0)
    BEGIN
        CASE (scalarizer_21589_mux_s) IS
            WHEN "0" => scalarizer_21589_mux_q <= in_scalarizer_21589_1;
            WHEN "1" => scalarizer_21589_mux_q <= in_scalarizer_21589_0;
            WHEN OTHERS => scalarizer_21589_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_21589(GPOUT,74)
    out_scalarizer_21589 <= scalarizer_21589_mux_q;

    -- scalarizer_21593_mux(MUX,93)
    scalarizer_21593_mux_s <= in_valid_in_0;
    scalarizer_21593_mux_combproc: PROCESS (scalarizer_21593_mux_s, in_scalarizer_21593_1, in_scalarizer_21593_0)
    BEGIN
        CASE (scalarizer_21593_mux_s) IS
            WHEN "0" => scalarizer_21593_mux_q <= in_scalarizer_21593_1;
            WHEN "1" => scalarizer_21593_mux_q <= in_scalarizer_21593_0;
            WHEN OTHERS => scalarizer_21593_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_21593(GPOUT,75)
    out_scalarizer_21593 <= scalarizer_21593_mux_q;

    -- scalarizer_21597_mux(MUX,94)
    scalarizer_21597_mux_s <= in_valid_in_0;
    scalarizer_21597_mux_combproc: PROCESS (scalarizer_21597_mux_s, in_scalarizer_21597_1, in_scalarizer_21597_0)
    BEGIN
        CASE (scalarizer_21597_mux_s) IS
            WHEN "0" => scalarizer_21597_mux_q <= in_scalarizer_21597_1;
            WHEN "1" => scalarizer_21597_mux_q <= in_scalarizer_21597_0;
            WHEN OTHERS => scalarizer_21597_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_21597(GPOUT,76)
    out_scalarizer_21597 <= scalarizer_21597_mux_q;

    -- scalarizer_3_mux(MUX,99)
    scalarizer_3_mux_s <= in_valid_in_0;
    scalarizer_3_mux_combproc: PROCESS (scalarizer_3_mux_s, in_scalarizer_3_1, in_scalarizer_3_0)
    BEGIN
        CASE (scalarizer_3_mux_s) IS
            WHEN "0" => scalarizer_3_mux_q <= in_scalarizer_3_1;
            WHEN "1" => scalarizer_3_mux_q <= in_scalarizer_3_0;
            WHEN OTHERS => scalarizer_3_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_3(GPOUT,77)
    out_scalarizer_3 <= scalarizer_3_mux_q;

    -- scalarizer_31590_mux(MUX,96)
    scalarizer_31590_mux_s <= in_valid_in_0;
    scalarizer_31590_mux_combproc: PROCESS (scalarizer_31590_mux_s, in_scalarizer_31590_1, in_scalarizer_31590_0)
    BEGIN
        CASE (scalarizer_31590_mux_s) IS
            WHEN "0" => scalarizer_31590_mux_q <= in_scalarizer_31590_1;
            WHEN "1" => scalarizer_31590_mux_q <= in_scalarizer_31590_0;
            WHEN OTHERS => scalarizer_31590_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_31590(GPOUT,78)
    out_scalarizer_31590 <= scalarizer_31590_mux_q;

    -- scalarizer_31594_mux(MUX,97)
    scalarizer_31594_mux_s <= in_valid_in_0;
    scalarizer_31594_mux_combproc: PROCESS (scalarizer_31594_mux_s, in_scalarizer_31594_1, in_scalarizer_31594_0)
    BEGIN
        CASE (scalarizer_31594_mux_s) IS
            WHEN "0" => scalarizer_31594_mux_q <= in_scalarizer_31594_1;
            WHEN "1" => scalarizer_31594_mux_q <= in_scalarizer_31594_0;
            WHEN OTHERS => scalarizer_31594_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_31594(GPOUT,79)
    out_scalarizer_31594 <= scalarizer_31594_mux_q;

    -- scalarizer_31598_mux(MUX,98)
    scalarizer_31598_mux_s <= in_valid_in_0;
    scalarizer_31598_mux_combproc: PROCESS (scalarizer_31598_mux_s, in_scalarizer_31598_1, in_scalarizer_31598_0)
    BEGIN
        CASE (scalarizer_31598_mux_s) IS
            WHEN "0" => scalarizer_31598_mux_q <= in_scalarizer_31598_1;
            WHEN "1" => scalarizer_31598_mux_q <= in_scalarizer_31598_0;
            WHEN OTHERS => scalarizer_31598_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_31598(GPOUT,80)
    out_scalarizer_31598 <= scalarizer_31598_mux_q;

    -- valid_or(LOGICAL,102)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,100)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,81)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,101)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,82)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- out_valid_out(GPOUT,83)
    out_valid_out <= valid_or_q;

END normal;
