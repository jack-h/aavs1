library IEEE;
use IEEE.std_logic_1164.all;

entity fir_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol_in0: in std_logic_vector(31 downto 0); 
    pol_in1: in std_logic_vector(31 downto 0); 
    sync_in: in std_logic; 
    vld_in: in std_logic; 
    dvld: out std_logic; 
    pol0: out std_logic_vector(35 downto 0); 
    pol1: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fir_core;

architecture structural of fir_core is
begin
end structural;

