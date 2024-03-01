----------------------------------------------------------------------------------
-- Company: USAFA?
-- Engineer: Joseph Shearer
-- 
-- Create Date: 02/22/2024 10:55:47 AM
-- Design Name: 
-- Module Name: sevenSegDecoder - Behavioral
-- Project Name: SevenSegDecoder
-- Target Devices: basys3 board
-- Tool Versions: Vivado 2018.2
-- Description: Makes the 8-shaped segment display
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture Behavioral of sevenSegDecoder_tb is

--    signal i_D : std_logic_vector (3 downto 0);
--    signal o_S : std_logic_vector (6 downto 0);
    signal sw : std_logic_vector (3 downto 0);
    signal seg : std_logic_vector (6 downto 0);

begin

	    UUT_inst : entity work.sevenSegDecoder
          port map (
            i_D => sw,
            o_S => seg
          );
          
          test: process 
          begin 
          
                sw <= (others => '0');
--                i_D <= (others => '0');
                
                sw <= "0000"; wait for 10 ns;
                    assert seg = "1000000" report "Error for input 0" severity error;
                sw <= "0001"; wait for 10 ns;
                    assert seg = "1111001" report "Error for input 1" severity error;
                sw <= "0010"; wait for 10 ns;
                    assert seg = "0100100" report "Error for input 2" severity error;
                sw <= "0011"; wait for 10 ns;
                    assert seg = "0110000" report "Error for input 3" severity error;
                sw <= "0100"; wait for 10 ns;
                    assert seg = "0011001" report "Error for input 4" severity error;
                sw <= "0101"; wait for 10 ns;
                    assert seg = "0010010" report "Error for input 5" severity error;
                sw <= "0110"; wait for 10 ns;
                    assert seg = "0000010" report "Error for input 6" severity error;
                sw <= "0111"; wait for 10 ns;
                    assert seg = "1111000" report "Error for input 7" severity error;
                sw <= "1000"; wait for 10 ns;
                    assert seg = "0000000" report "Error for input 8" severity error;
                sw <= "1001"; wait for 10 ns;
                    assert seg = "0011000" report "Error for input 9" severity error;
                sw <= "1010"; wait for 10 ns;
                    assert seg = "0001000" report "Error for input A" severity failure;
                sw <= "1011"; wait for 10 ns;
                    assert seg = "0000011" report "Error for input B" severity error;
                sw <= "1100"; wait for 10 ns;
                    assert seg = "0100111" report "Error for input C" severity error;
                sw <= "1101"; wait for 10 ns;
                    assert seg = "0100001" report "Error for input D" severity error;
                sw <= "1110"; wait for 10 ns;
                    assert seg = "0000110" report "Error for input E" severity error;
                sw <= "1111"; wait for 10 ns;
                    assert seg = "0001110" report "Error for input F" severity error;
                wait;
                end process;
end Behavioral;
