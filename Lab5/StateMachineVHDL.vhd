--StateMachineVHDL.VHD (VHDL)
--This code produces a three-state moore state machine
--Jiacheng Zhang
--ECE2031 L07
--02/13/2022

library ieee;
use ieee.std_logic_1164.all;

entity StateMachineVHDL is

	port(
		xmas, cool, resetn, clk	 : in	std_logic;
		r_en, g_en, b_en         : out std_logic;
		Q 								 : out std_logic_vector(1 downto 0)
	);

end entity;

architecture rtl of StateMachineVHDL is

	-- Build an enumerated type for the state machine
	type state_type is (Red, Green, blue);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, resetn)
	begin
		if resetn = '0' then
			state <= Red;
		elsif (rising_edge(clk)) then
			case state is
				when Red=>
					if (xmas = '0') and (cool = '0') then
						state <= Green;
					elsif (xmas = '0') and (cool = '1') then
						state <= Green;
					elsif	(xmas = '1') and (cool = '0') then
						state <= Green;
					else
						state <= Green;
					end if;
				when Green=>
					if (xmas = '0') and (cool = '0') then
						state <= Blue;
					elsif (xmas = '0') and (cool = '1') then
						state <= Blue;
					elsif	(xmas = '1') and (cool = '0') then
						state <= Red;
					else
						state <= Blue;
					end if;
				when Blue=>
					if (xmas = '0') and (cool = '0') then
						state <= Red;
					elsif (xmas = '0') and (cool = '1') then
						state <= Blue;
					elsif	(xmas = '1') and (cool = '0') then
						state <= Red;
					else
						state <= Blue;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when Red =>
				Q <= "00";
				r_en <= '1';
				g_en <= '0';
				b_en <= '0';
			when Green =>
				Q <= "01";
				r_en <= '0';
				g_en <= '1';
				b_en <= '0';
			when Blue =>
				Q <= "10";
				r_en <= '0';
				g_en <= '0';
				b_en <= '1';
		end case;
	end process;

end rtl;
