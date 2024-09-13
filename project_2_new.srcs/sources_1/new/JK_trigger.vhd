library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_trigger is
    Port (
        not_S : in STD_LOGIC;  -- Вход S (Set)
        not_R : in STD_LOGIC;  -- Вход R (Reset)
        J : in STD_LOGIC;      -- Вход J
        C : in STD_LOGIC;      -- Тактовый сигнал (Clock)
        K : in STD_LOGIC;      -- Вход K
        Q : out STD_LOGIC;     -- Выход Q
        not_Q : out STD_LOGIC      -- Выход не Q
    );
end JK_trigger;

architecture Behavioral of JK_trigger is
    signal Q_int : STD_LOGIC := '0';  -- Внутренний сигнал для хранения состояния
begin
    process(C, not_R)
    begin
        if not_R = '0' then
            Q_int <= '0';  -- Сброс состояния
        elsif not_S = '0' then
            Q_int <= '1';  -- Установка в 1
        elsif rising_edge(C) then       -- Для подъема сигнала
            if J = '1' and K = '0' then
                Q_int <= '1';  -- Установка в 1
            elsif J = '0' and K = '1' then
                Q_int <= '0';  -- Установка в 0
            elsif J = '1' and K = '1' then
                Q_int <= not Q_int;  -- Переключение состояния
            end if;
        end if;
    end process;

    Q <= Q_int;  -- Выход Q
    not_Q <= not Q_int;  -- Выход не Q
end Behavioral;