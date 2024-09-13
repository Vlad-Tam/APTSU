library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_trigger_testbench is
end JK_trigger_testbench;

architecture Behavioral of JK_trigger_testbench is
    component JK_trigger
        port(
            not_R : in  STD_LOGIC;
            not_S : in  STD_LOGIC;
            C : in  STD_LOGIC;
            J : in  STD_LOGIC;
            K : in  STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;
    
    signal not_R : STD_LOGIC := '1';
    signal not_S : STD_LOGIC := '1';
    signal C : STD_LOGIC := '0';
    signal J : STD_LOGIC := '1';
    signal K : STD_LOGIC := '1';
    signal Q : STD_LOGIC;

begin
    -- Инстанциация триггера
    uut: JK_trigger
        port map (
            not_S => not_S,
            not_R => not_R,
            J => J,
            C => C,
            K => K,
            Q => Q
        );

    -- Генерация тестовых сигналов
    stim_process: process
    begin
        not_R <= '1';
        not_S <= '1';
        C <= '0';
        J <= '1';
        K <= '1';
        wait for 10 ns;
        C <= '1';
        wait for 10 ns;
        not_R <= '0';
        C <= '0';
        wait for 10 ns;
        C <= '1';
        wait for 10 ns;
        not_R <= '1';
        C <= '0';
        wait for 10 ns;
        C <= '1';
        wait for 10 ns;
        C <= '0';
        wait for 10 ns;
        C <= '1';
        wait for 10 ns;
        C <= '0';
        not_S <= '0';
        wait for 10 ns;
        C <= '1';
        wait for 10 ns;
        C <= '0';
        not_S <= '1';
        J <= '0';
        wait for 10 ns;
        C <= '1';
        wait for 10 ns;
        C <= '0';
        K <= '0';
        J <= '1';
        wait for 10 ns;
        C <= '1';
        wait for 10 ns;
        C <= '0';
        K <= '1';
        wait for 10 ns;
        C <= '1';
        wait for 10 ns;
    end process;

end Behavioral;
