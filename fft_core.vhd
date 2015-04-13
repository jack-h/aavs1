library IEEE;
use IEEE.std_logic_1164.all;

entity fft_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    pol_in0: in std_logic_vector(35 downto 0); 
    pol_in1: in std_logic_vector(35 downto 0); 
    pol_in10: in std_logic_vector(35 downto 0); 
    pol_in11: in std_logic_vector(35 downto 0); 
    pol_in12: in std_logic_vector(35 downto 0); 
    pol_in13: in std_logic_vector(35 downto 0); 
    pol_in14: in std_logic_vector(35 downto 0); 
    pol_in15: in std_logic_vector(35 downto 0); 
    pol_in2: in std_logic_vector(35 downto 0); 
    pol_in3: in std_logic_vector(35 downto 0); 
    pol_in4: in std_logic_vector(35 downto 0); 
    pol_in5: in std_logic_vector(35 downto 0); 
    pol_in6: in std_logic_vector(35 downto 0); 
    pol_in7: in std_logic_vector(35 downto 0); 
    pol_in8: in std_logic_vector(35 downto 0); 
    pol_in9: in std_logic_vector(35 downto 0); 
    shift_in: in std_logic_vector(9 downto 0); 
    sync_in: in std_logic; 
    oflow: out std_logic_vector(7 downto 0); 
    pol0: out std_logic_vector(35 downto 0); 
    pol1: out std_logic_vector(35 downto 0); 
    pol10: out std_logic_vector(35 downto 0); 
    pol11: out std_logic_vector(35 downto 0); 
    pol12: out std_logic_vector(35 downto 0); 
    pol13: out std_logic_vector(35 downto 0); 
    pol14: out std_logic_vector(35 downto 0); 
    pol15: out std_logic_vector(35 downto 0); 
    pol2: out std_logic_vector(35 downto 0); 
    pol3: out std_logic_vector(35 downto 0); 
    pol4: out std_logic_vector(35 downto 0); 
    pol5: out std_logic_vector(35 downto 0); 
    pol6: out std_logic_vector(35 downto 0); 
    pol7: out std_logic_vector(35 downto 0); 
    pol8: out std_logic_vector(35 downto 0); 
    pol9: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_core;

architecture structural of fft_core is
begin
end structural;

