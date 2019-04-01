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

-- VHDL created from loop_capacity_FIFO
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

entity loop_capacity_FIFO is
    port (
        in_data_in : in std_logic_vector(2245 downto 0);  -- ufix2246
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out : out std_logic_vector(2245 downto 0);  -- ufix2246
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end loop_capacity_FIFO;

architecture normal of loop_capacity_FIFO is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DATA_WIDTH : INTEGER := 2246;
            DEPTH : INTEGER := 123;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(2245 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(2245 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal loop_capacity_FIFO_data_in : STD_LOGIC_VECTOR (2245 downto 0);
    signal loop_capacity_FIFO_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_stall_in_bitsignaltemp : std_logic;
    signal loop_capacity_FIFO_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_valid_in_bitsignaltemp : std_logic;
    signal loop_capacity_FIFO_data_out : STD_LOGIC_VECTOR (2245 downto 0);
    signal loop_capacity_FIFO_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_stall_out_bitsignaltemp : std_logic;
    signal loop_capacity_FIFO_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_valid_out_bitsignaltemp : std_logic;

begin


    -- loop_capacity_FIFO(EXTIFACE,5)
    loop_capacity_FIFO_data_in <= in_data_in;
    loop_capacity_FIFO_stall_in <= in_stall_in;
    loop_capacity_FIFO_valid_in <= in_valid_in;
    loop_capacity_FIFO_stall_in_bitsignaltemp <= loop_capacity_FIFO_stall_in(0);
    loop_capacity_FIFO_valid_in_bitsignaltemp <= loop_capacity_FIFO_valid_in(0);
    loop_capacity_FIFO_stall_out(0) <= loop_capacity_FIFO_stall_out_bitsignaltemp;
    loop_capacity_FIFO_valid_out(0) <= loop_capacity_FIFO_valid_out_bitsignaltemp;
    theloop_capacity_FIFO : acl_data_fifo
    GENERIC MAP (
        DATA_WIDTH => 2246,
        DEPTH => 123,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => in_data_in,
        stall_in => loop_capacity_FIFO_stall_in_bitsignaltemp,
        valid_in => loop_capacity_FIFO_valid_in_bitsignaltemp,
        data_out => loop_capacity_FIFO_data_out,
        stall_out => loop_capacity_FIFO_stall_out_bitsignaltemp,
        valid_out => loop_capacity_FIFO_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- out_data_out(GPOUT,6)
    out_data_out <= loop_capacity_FIFO_data_out;

    -- out_stall_out(GPOUT,7)
    out_stall_out <= loop_capacity_FIFO_stall_out;

    -- out_valid_out(GPOUT,8)
    out_valid_out <= loop_capacity_FIFO_valid_out;

END normal;
