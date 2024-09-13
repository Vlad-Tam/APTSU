library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_wrapper is
    Port (
        not_R : in STD_LOGIC;  -- Вход R (Reset)
        not_C : in STD_LOGIC;  -- Вход C (Clock)
        D : in STD_LOGIC;      -- Вход D
        Q : out STD_LOGIC;     -- Выход Q
        not_Q : out STD_LOGIC   -- Выход не Q
    );
end JK_wrapper;

architecture Behavioral of JK_wrapper is
    signal J : STD_LOGIC;
    signal K : STD_LOGIC;
    signal C : STD_LOGIC;
begin
    -- Присваиваем J и K для работы как D-триггер
    J <= D;  -- J принимает значение D
    K <= not D;  -- K принимает противоположное значение D
    C <= not_C;  -- Переключаем сигнал для использования в JK-триггере

    -- Инстанцируем JK-триггер
    JK_inst : entity work.JK_trigger
        port map (
            not_S => '1',  -- Не используем вход S
            not_R => not_R,
            J => J,
            C => C,
            K => K,
            Q => Q,
            not_Q => not_Q
        );
end Behavioral;
