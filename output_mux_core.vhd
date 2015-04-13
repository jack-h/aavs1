library IEEE;
use IEEE.std_logic_1164.all;

entity output_mux_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(63 downto 0); 
    din1: in std_logic_vector(63 downto 0); 
    din10: in std_logic_vector(63 downto 0); 
    din11: in std_logic_vector(63 downto 0); 
    din12: in std_logic_vector(63 downto 0); 
    din13: in std_logic_vector(63 downto 0); 
    din14: in std_logic_vector(63 downto 0); 
    din15: in std_logic_vector(63 downto 0); 
    din16: in std_logic_vector(63 downto 0); 
    din17: in std_logic_vector(63 downto 0); 
    din18: in std_logic_vector(63 downto 0); 
    din19: in std_logic_vector(63 downto 0); 
    din2: in std_logic_vector(63 downto 0); 
    din20: in std_logic_vector(63 downto 0); 
    din21: in std_logic_vector(63 downto 0); 
    din22: in std_logic_vector(63 downto 0); 
    din23: in std_logic_vector(63 downto 0); 
    din24: in std_logic_vector(63 downto 0); 
    din25: in std_logic_vector(63 downto 0); 
    din26: in std_logic_vector(63 downto 0); 
    din27: in std_logic_vector(63 downto 0); 
    din28: in std_logic_vector(63 downto 0); 
    din29: in std_logic_vector(63 downto 0); 
    din3: in std_logic_vector(63 downto 0); 
    din30: in std_logic_vector(63 downto 0); 
    din31: in std_logic_vector(63 downto 0); 
    din32: in std_logic_vector(63 downto 0); 
    din33: in std_logic_vector(63 downto 0); 
    din34: in std_logic_vector(63 downto 0); 
    din35: in std_logic_vector(63 downto 0); 
    din4: in std_logic_vector(63 downto 0); 
    din5: in std_logic_vector(63 downto 0); 
    din6: in std_logic_vector(63 downto 0); 
    din7: in std_logic_vector(63 downto 0); 
    din8: in std_logic_vector(63 downto 0); 
    din9: in std_logic_vector(63 downto 0); 
    vld: in std_logic; 
    dout: out std_logic_vector(63 downto 0); 
    win_sync_out: out std_logic; 
    win_vld_out: out std_logic
  );
end output_mux_core;

architecture structural of output_mux_core is
begin
end structural;

