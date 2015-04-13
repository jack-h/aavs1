library IEEE;
use IEEE.std_logic_1164.all;

entity cmult_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(15 downto 0); 
    din1: in std_logic_vector(15 downto 0); 
    din2: in std_logic_vector(15 downto 0); 
    din3: in std_logic_vector(15 downto 0); 
    din4: in std_logic_vector(15 downto 0); 
    din5: in std_logic_vector(15 downto 0); 
    din6: in std_logic_vector(15 downto 0); 
    din7: in std_logic_vector(15 downto 0); 
    sync_in: in std_logic; 
    dout00: out std_logic_vector(63 downto 0); 
    dout01: out std_logic_vector(63 downto 0); 
    dout02: out std_logic_vector(63 downto 0); 
    dout03: out std_logic_vector(63 downto 0); 
    dout04: out std_logic_vector(63 downto 0); 
    dout05: out std_logic_vector(63 downto 0); 
    dout06: out std_logic_vector(63 downto 0); 
    dout07: out std_logic_vector(63 downto 0); 
    dout11: out std_logic_vector(63 downto 0); 
    dout12: out std_logic_vector(63 downto 0); 
    dout13: out std_logic_vector(63 downto 0); 
    dout14: out std_logic_vector(63 downto 0); 
    dout15: out std_logic_vector(63 downto 0); 
    dout16: out std_logic_vector(63 downto 0); 
    dout17: out std_logic_vector(63 downto 0); 
    dout22: out std_logic_vector(63 downto 0); 
    dout23: out std_logic_vector(63 downto 0); 
    dout24: out std_logic_vector(63 downto 0); 
    dout25: out std_logic_vector(63 downto 0); 
    dout26: out std_logic_vector(63 downto 0); 
    dout27: out std_logic_vector(63 downto 0); 
    dout33: out std_logic_vector(63 downto 0); 
    dout34: out std_logic_vector(63 downto 0); 
    dout35: out std_logic_vector(63 downto 0); 
    dout36: out std_logic_vector(63 downto 0); 
    dout37: out std_logic_vector(63 downto 0); 
    dout44: out std_logic_vector(63 downto 0); 
    dout45: out std_logic_vector(63 downto 0); 
    dout46: out std_logic_vector(63 downto 0); 
    dout47: out std_logic_vector(63 downto 0); 
    dout55: out std_logic_vector(63 downto 0); 
    dout56: out std_logic_vector(63 downto 0); 
    dout57: out std_logic_vector(63 downto 0); 
    dout66: out std_logic_vector(63 downto 0); 
    dout67: out std_logic_vector(63 downto 0); 
    dout77: out std_logic_vector(63 downto 0); 
    vld_out: out std_logic
  );
end cmult_core;

architecture structural of cmult_core is
begin
end structural;

