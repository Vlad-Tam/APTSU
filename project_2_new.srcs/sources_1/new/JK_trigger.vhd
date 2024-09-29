library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_trigger is
    Port (
        not_S : in STD_LOGIC;
        not_R : in STD_LOGIC;
        J : in STD_LOGIC;
        C : in STD_LOGIC;
        K : in STD_LOGIC;
        Q : out STD_LOGIC;
        not_Q : out STD_LOGIC
    );
end JK_trigger;

architecture Behavioral of JK_trigger is
    signal Q_int : STD_LOGIC := '0';  -- Внутренний сигнал для хранения состояния
begin
    process(C, not_R)
    begin
        if not_R = '0' then
            Q_int <= '0';
        elsif not_S = '0' then
            Q_int <= '1';
        elsif rising_edge(C) then       -- Для подъема сигнала
            if J = '1' and K = '0' then
                Q_int <= '1';
            elsif J = '0' and K = '1' then
                Q_int <= '0';
            elsif J = '1' and K = '1' then
                Q_int <= not Q_int;
            end if;
        end if;
    end process;

    Q <= Q_int;
    not_Q <= not Q_int;
end Behavioral;