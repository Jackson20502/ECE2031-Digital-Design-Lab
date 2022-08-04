-- TrainController.VHD (VHDL)
-- State machine to control trains
-- Jiacheng Zhang 
-- ECE2031 L07
-- 02/23/2022

LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;


ENTITY TrainController IS
	PORT(
		reset, clock, sensor1, sensor2      : IN std_logic;
		sensor3, sensor4, sensor5, sensor6  : IN std_logic;
		switch1, switch2, switch3, switch4  : OUT std_logic;
		dirA, dirB                          : OUT std_logic_vector(1 DOWNTO 0)
	);
END TrainController;


ARCHITECTURE a OF TrainController IS
	-- Create a new TYPE called STATE_TYPE that is only allowed
	-- to have the values specified here. This
	-- 1) enables using helpful names for values instead of
	--    arbitrary values
	-- 2) ensures that signals of this type can only have valid values, and 
	-- 3) helps the synthesis software create efficient hardware for the design.
	TYPE STATE_TYPE IS (
		ABout,
		ARBout,
		ABRout,
		ARBRout,
		AinBout,
		ARinBout,
		AinBRout,
		ARinBRout,
		BinAout,
		BRinAout,
		BinARout,
		BRinARout
	);
	-- Create a signal of the new type.  Note that there is
	-- nothing special about the names "state" or "state_type", but it makes
	-- sense to use these names because those names fit their purpose.
	SIGNAL state                                : STATE_TYPE;
	-- This creates some new internal signals which will be concatenations
	-- of some of the sensor signals.  This will make CASE statements easier.
	-- Note that the names are *not* what makes them concatenations of the relevant
	-- signals; all of these signals need to be assigned values in the architecture.
	SIGNAL sensor12, sensor13, sensor24, sensor34   : std_logic_vector(1 DOWNTO 0);

BEGIN
	-- A process statement is required for clocked logic, such as a state machine.
	PROCESS (clock, reset)
	BEGIN
		IF reset = '1' THEN -- This state machine uses an active-high reset.
			-- Reset to this state
			state <= ABout;
		ELSIF clock'EVENT AND clock = '1' THEN
			-- Case statement to determine next state.
			-- Case statements are a nice, clean way to make decisions
			-- based on different values of a signal.
			CASE state IS
				WHEN ABout =>
					CASE sensor12 IS
						WHEN "00" => state <= ABout;
						WHEN "01" => state <= BinAout;
						WHEN "10" => state <= AinBout;
						WHEN "11" => state <= AinBRout;
						WHEN OTHERS => state <= ABout;
					END CASE;
					
				WHEN ARBout =>
					CASE sensor24 IS
						WHEN "00" => state <= ARBout;
						WHEN "01" => state <= ARinBout;
						WHEN "10" => state <= BinARout;
						WHEN "11" => state <= BinAout;
						WHEN OTHERS => state <= ARBout;
					END CASE;
					
				WHEN ABRout =>
					CASE sensor13 IS
						WHEN "00" => state <= ABRout;
						WHEN "01" => state <= BRinAout;
						WHEN "10" => state <= AinBRout;
						WHEN "11" => state <= AinBout;
						WHEN OTHERS => state <= ABRout;
					END CASE;
					
				WHEN ARBRout =>
					CASE sensor34 IS
						WHEN "00" => state <= ARBRout;
						WHEN "01" => state <= ARinBRout;
						WHEN "10" => state <= BRinARout;
						WHEN "11" => state <= ARinBout;
						WHEN OTHERS => state <= ARBRout;
					END CASE;

				WHEN AinBout =>
					CASE sensor24 IS
						WHEN "00" => state <= AinBout;
						WHEN "01" => state <= ABout;
						WHEN "10" => state <= AinBRout;
						WHEN "11" => state <= BinAout;
						WHEN OTHERS => state <= AinBout;
					END CASE;
					
				WHEN ARinBout =>
					CASE sensor12 IS
						WHEN "00" => state <= ARinBout;
						WHEN "01" => state <= ARinBRout;
						WHEN "10" => state <= ARBout;
						WHEN "11" => state <= BinARout;
						WHEN OTHERS => state <= ARinBout;
					END CASE;
					
				WHEN AinBRout =>
					CASE sensor34 IS
						WHEN "00" => state <= AinBRout;
						WHEN "01" => state <= ABRout;
						WHEN "10" => state <= AinBout;
						WHEN "11" => state <= BRinAout;
						WHEN OTHERS => state <= AinBRout;
					END CASE;
					
				WHEN ARinBRout =>
					CASE sensor13 IS
						WHEN "00" => state <= ARinBRout;
						WHEN "01" => state <= ARinBout;
						WHEN "10" => state <= ARBRout;
						WHEN "11" => state <= BRinARout;
						WHEN OTHERS => state <= ARinBRout;
					END CASE;

				WHEN BinAout =>
					CASE sensor13 IS
						WHEN "00" => state <= BinAout;
						WHEN "01" => state <= ABout;
						WHEN "10" => state <= BinARout;
						WHEN "11" => state <= AinBout;
						WHEN OTHERS => state <= BinAout;
					END CASE;
					
				WHEN BRinAout =>
					CASE sensor12 IS
						WHEN "00" => state <= BRinAout;
						WHEN "01" => state <= ABRout;
						WHEN "10" => state <= BRinARout;
						WHEN "11" => state <= AinBRout;
						WHEN OTHERS => state <= BRinAout;
					END CASE;
					
				WHEN BinARout =>
					CASE sensor34 IS
						WHEN "00" => state <= BinARout;
						WHEN "01" => state <= BinAout;
						WHEN "10" => state <= ARBout;
						WHEN "11" => state <= ARinBout;
						WHEN OTHERS => state <= BinARout;
					END CASE;
					
				WHEN BRinARout =>
					CASE sensor24 IS
						WHEN "00" => state <= BRinARout;
						WHEN "01" => state <= BRinAout;
						WHEN "10" => state <= ARBRout;
						WHEN "11" => state <= ARinBRout;
						WHEN OTHERS => state <= BRinARout;
					END CASE;					

			END CASE;
		END IF;
	END PROCESS;

	-- Notice that all of the following logic is NOT in a process block,
	-- and thus does not depend on any clock.  Everything here is pure combinational
	-- logic, and exists in parallel with everything else.
	
	-- Combine bits for the internal signals declared above.
	-- ("&" operator is concatenation)
	sensor12 <= sensor1 & sensor2;
	sensor13 <= sensor1 & sensor3;
	sensor24 <= sensor2 & sensor4;
	sensor34 <= sensor3 & sensor4;

	-- The following outputs depend on the state.  This is a Moore state machine.
	WITH state SELECT Switch1 <=
		'-' WHEN ABout,
		'-' WHEN ARBout,
		'-' WHEN ABRout,
		'-' WHEN ARBRout,
		'0' WHEN AinBout,
		'0' WHEN ARinBout,
		'0' WHEN AinBRout,
		'0' WHEN ARinBRout,
		'1' WHEN BinAout,
		'1' WHEN BRinAout,
		'1' WHEN BinARout,
		'1' WHEN BRinARout;
	WITH state SELECT Switch2 <=
		'-' WHEN ABout,
		'-' WHEN ARBout,
		'-' WHEN ABRout,
		'-' WHEN ARBRout,
		'0' WHEN AinBout,
		'0' WHEN ARinBout,
		'0' WHEN AinBRout,
		'0' WHEN ARinBRout,
		'1' WHEN BinAout,
		'1' WHEN BRinAout,
		'1' WHEN BinARout,
		'1' WHEN BRinARout;
	WITH state SELECT Switch3 <=
		'0' WHEN ABout,
		'0' WHEN ARBout,
		'0' WHEN ABRout,
		'0' WHEN ARBRout,
		'-' WHEN AinBout,
		'-' WHEN ARinBout,
		'-' WHEN AinBRout,
		'-' WHEN ARinBRout,
		'0' WHEN BinAout,
		'0' WHEN BRinAout,
		'0' WHEN BinARout,
		'0' WHEN BRinARout;
	WITH state SELECT Switch4 <=
		'0' WHEN ABout,
		'0' WHEN ARBout,
		'0' WHEN ABRout,
		'0' WHEN ARBRout,
		'-' WHEN AinBout,
		'-' WHEN ARinBout,
		'-' WHEN AinBRout,
		'-' WHEN ARinBRout,
		'0' WHEN BinAout,
		'0' WHEN BRinAout,
		'0' WHEN BinARout,
		'0' WHEN BRinARout;
	WITH state SELECT DirA <=
		"01" WHEN ABout,
		"10" WHEN ARBout,
		"01" WHEN ABRout,
		"10" WHEN ARBRout,
		"01" WHEN AinBout,
		"10" WHEN ARinBout,
		"01" WHEN AinBRout,
		"10" WHEN ARinBRout,
		"01" WHEN BinAout,
		"01" WHEN BRinAout,
		"10" WHEN BinARout,
		"10" WHEN BRinARout;
	WITH state SELECT DirB <=
		"01" WHEN ABout,
		"01" WHEN ARBout,
		"10" WHEN ABRout,
		"10" WHEN ARBRout,
		"01" WHEN AinBout,
		"01" WHEN ARinBout,
		"10" WHEN AinBRout,
		"10" WHEN ARinBRout,
		"01" WHEN BinAout,
		"10" WHEN BRinAout,
		"01" WHEN BinARout,
		"10" WHEN BRinARout;
	
	-- These outputs happen to be constant values for this solution;
	-- they do not depend on the state.
	-- Switch3 <= '0';
	-- Switch4 <= '0';

END a;


