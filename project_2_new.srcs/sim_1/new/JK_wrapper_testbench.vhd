library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_wrapper_testbench is
end JK_wrapper_testbench;

architecture Behavioral of JK_wrapper_testbench is
    component JK_wrapper
        port(
            not_R : in  STD_LOGIC;
            not_C : in  STD_LOGIC;
            D : in  STD_LOGIC;
            Q : out STD_LOGIC;
            not_Q : out STD_LOGIC
        );
    end component;
    
    signal not_R : STD_LOGIC := '1';
    signal not_C : STD_LOGIC := '1';
    signal D : STD_LOGIC := '0';
    signal Q : STD_LOGIC;
    signal not_Q : STD_LOGIC;

begin
    -- Инстанциация JK_wrapper
    uut: JK_wrapper
        port map (
            not_R => not_R,
            not_C => not_C,
            D => D,
            Q => Q,
            not_Q => not_Q
        );

    -- Генерация тестовых сигналов
    stim_process: process
    begin
        not_R <= '1';
        not_C <= '0';
        D <= '1';
        wait for 10 ns;
        not_C <= '1';
        wait for 10 ns;
        not_R <= '0';
        not_C <= '0';
        wait for 10 ns;
        not_C <= '1';
        wait for 10 ns;
        not_R <= '1';
        not_C <= '0';
        wait for 10 ns;
        not_C <= '1';
        wait for 10 ns;
        not_C <= '0';
        D <= '0';
        wait for 10 ns;
        not_C <= '1';
        wait for 10 ns;
        not_C <= '0';
        wait for 10 ns;
        not_C <= '1';
        wait for 10 ns;
        not_C <= '0';
        wait for 10 ns;
        not_C <= '1';
        wait for 10 ns;
        not_C <= '0';
        D <= '1';
        wait for 10 ns;
        not_C <= '1';
        wait for 10 ns;
        not_C <= '0';
        wait for 10 ns;
        not_C <= '1';
        D <= '0';
        wait for 10 ns;
        not_C <= '0';
        wait for 10 ns;
        not_C <= '1';
        wait for 10 ns;
    end process;

end Behavioral;